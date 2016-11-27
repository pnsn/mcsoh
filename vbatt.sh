#!/bin/bash 
if [ $1 ]
  then 
  sta=$1
else
  echo must provide station  as first argument
  exit
fi
rrdtool graph /var/www/assets/mcsoh/images/${sta}_vbatt_graph.png \
-w 785 -h 120 -a PNG \
--slope-mode \
--start -2week --end='+2w'  \
--font DEFAULT:7: \
--title "Station $sta MPPT Solar Controller Data" \
--watermark "`date`" \
--vertical-label "Volts" \
--right-axis-label "Volts" \
--lower-limit 10 \
--upper-limit 16 \
--rigid \
--right-axis 1:0 \
--color CANVAS#000000 \
DEF:V_lvd=/var/www/rrd/${sta}_mppt.rrd:V_lvd:AVERAGE \
CDEF:LVD=V_lvd,100,32768,/,* \
DEF:Adc_vb_f=/var/www/rrd/${sta}_mppt.rrd:Adc_vb_f:AVERAGE \
CDEF:Vbatt=Adc_vb_f,100,32768,/,* \
DEF:data1=/var/www/rrd/${sta}_mppt.rrd:Adc_vb_f:MIN:start=now-8d:end=now+1d \
CDEF:data1Scaled=data1,100,32768,/,* \
DEF:data2=/var/www/rrd/${sta}_mppt.rrd:Adc_vb_f:MIN:start=now-2w:end=now+20d \
CDEF:data2Scaled=data2,100,32768,/,* \
LINE2:Vbatt#ff00ff:"Vbatt" \
GPRINT:Vbatt:LAST:"Last\:%2.2lf" \
GPRINT:Vbatt:AVERAGE:"Avg\:%2.2lf" \
GPRINT:Vbatt:MAX:"Max\:%2.2lf" \
GPRINT:Vbatt:MIN:"Min\:%2.2lf" \
VDEF:D=data2Scaled,LSLSLOPE \
VDEF:H=data2Scaled,LSLINT \
CDEF:projection=data2Scaled,POP,D,COUNT,*,H,+ \
LINE2:projection#ffff00:"Vbatt Projection":dashes \
VDEF:D1=LVD,LSLSLOPE \
VDEF:H1=LVD,LSLINT \
CDEF:projectionLVD=LVD,POP,D1,COUNT,*,H1,+ \
LINE2:LVD#ff0000:"LVD" \
GPRINT:LVD:LAST:" Last\:%2.2lf" \
LINE2:projectionLVD#ff0000:"LVD Projection":dashes \
LINE2:11.4 \
AREA:-5#ff000066::STACK 
