#!/bin/bash 
if [ $1 ]
  then 
  sta=$1
else
  echo must provide station  as first argument
  exit
fi

rrdtool graph /var/www/assets/mcsoh/images/${sta}_vbatt-lvd_graph.png \
-w 785 -h 120 -a PNG \
--slope-mode \
--start -360000 --end now \
--font DEFAULT:7: \
--title "Station $sta MPPT Solar Controller Data" \
--watermark "`date`" \
--vertical-label "Volts" \
--right-axis-label "Volts" \
--lower-limit 0 \
--right-axis 1:0 \
--color CANVAS#000000 \
DEF:Adc_vb_f=/var/www/rrd/${sta}_mppt.rrd:Adc_vb_f:AVERAGE \
DEF:Adc_va_f=/var/www/rrd/${sta}_mppt.rrd:Adc_va_f:AVERAGE \
DEF:V_lvd=/var/www/rrd/${sta}_mppt.rrd:V_lvd:AVERAGE \
DEF:Load_State=/var/www/rrd/${sta}_mppt.rrd:Load_State:AVERAGE \
CDEF:Vbatt=Adc_vb_f,100,32768,/,* \
CDEF:Varray=Adc_va_f,100,32768,/,* \
CDEF:LVD=V_lvd,100,32768,/,* \
CDEF:Vbatt-LVD=Vbatt,LVD,- \
COMMENT:"This line is the difference of Vbatt and LVD. When this line hits Zero, the Low Voltage Disconnect is activated.\n" \
COMMENT:"I think this may be a good way to watch mulitple systems longterm, it simplifies the graphs...I think \n" \
LINE2:Vbatt-LVD#ff0000:"Vbatt-LVD" \
GPRINT:Vbatt-LVD:LAST:" Last\:%2.2lf" \
GPRINT:Vbatt-LVD:AVERAGE:" Avg\:%2.2lf"  \
GPRINT:Vbatt-LVD:MAX:" Max\:%2.2lf"  \
GPRINT:Vbatt-LVD:MIN:" Min\:%2.2lf\n" 
