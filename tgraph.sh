#!/bin/bash 
if [ $1 ]
  then 
  sta=$1
else
  echo must provide station  as first argument
  exit
fi

rrdtool graph /var/www/assets/mcsoh/images/${sta}_Temps_graph.png \
-w 785 -h 120 -a PNG \
--slope-mode \
--start -2week --end now \
--font DEFAULT:7: \
--title "Station $sta MPPT Solar Controller Data" \
--watermark "`date`" \
--vertical-label "Temperature in C degrees" \
--right-axis-label "Temperature in C degrees" \
--lower-limit -30 \
--right-axis 1:0 \
--color CANVAS#000000 \
DEF:T_amb=/var/www/rrd/${sta}_mppt.rrd:T_amb:AVERAGE \
DEF:T_batt=/var/www/rrd/${sta}_mppt.rrd:T_batt:AVERAGE \
CDEF:Temp_Amb=T_amb,1,*  \
CDEF:Temp_Batt=T_batt,1,* \
LINE2:Temp_Amb#ff0000:"Ambient Temperature in Celcius" \
GPRINT:Temp_Amb:LAST:"Last\:%2.2lf" \
GPRINT:Temp_Amb:AVERAGE:"Avg\:%2.2lf" \
GPRINT:Temp_Amb:MAX:"Max\:%2.2lf" \
GPRINT:Temp_Amb:MIN:"Min\:%2.2lf\n" \
LINE2:Temp_Batt#00ff00:"Battery Temperature in Celcius" \
GPRINT:Temp_Batt:LAST:"Last\:%2.2lf" \
GPRINT:Temp_Batt:AVERAGE:"Avg\:%2.2lf" \
GPRINT:Temp_Batt:MAX:"Max\:%2.2lf" \
GPRINT:Temp_Batt:MIN:"Min\:%2.2lf\n" 


