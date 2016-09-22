#!/bin/bash 
if [ $1 ]
  then 
  sta=$1
else
  echo must provide station  as first argument
  exit
fi
rrdtool graph /var/www/assets/mcsoh/images/${sta}_voltage_graph.png \
-w 785 -h 120 -a PNG \
--slope-mode \
--start -1209600 --end now \
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
CDEF:Vbatt=Adc_vb_f,100,32768,/,* \
CDEF:Varray=Adc_va_f,100,32768,/,* \
CDEF:LVD=V_lvd,100,32768,/,* \
COMMENT:"The "LVD" voltage is a load current compensated, Low Voltage Disconnect.\\l" \
COMMENT:"This line is a constant set point, but may adjust based on loading.\\l" \
LINE2:LVD#ff0000:"LVD" \
GPRINT:LVD:LAST:" Last\:%2.2lf\l" \
LINE2:Vbatt#ff00ff:"Vbatt" \
GPRINT:Vbatt:LAST:"Last\:%2.2lf" \
GPRINT:Vbatt:AVERAGE:"Avg\:%2.2lf" \
GPRINT:Vbatt:MAX:"Max\:%2.2lf" \
GPRINT:Vbatt:MIN:"Min\:%2.2lf\n" \
LINE2:Varray#ffff00:"Varray" \
GPRINT:Varray:LAST:"Last\:%2.2lf" \
GPRINT:Varray:AVERAGE:"Avg\:%2.2lf" \
GPRINT:Varray:MAX:"Max\:%2.2lf" \
GPRINT:Varray:MIN:"Min\:%2.2lf\n" 
 
 

