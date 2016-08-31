#!/bin/bash 
rrdtool graph /var/www/assets/mcsoh/images/CommDura_graph.png \
-w 785 -h 120 -a PNG \
--slope-mode \
--start -864000 --end now \
--font DEFAULT:7: \
--title "Round Trip Communication Duration" \
--watermark "`date`" \
--vertical-label "Seconds" \
--right-axis-label "Seconds" \
--lower-limit 0 \
--right-axis 1:0 \
--color CANVAS#000000 \
DEF:CD0=/var/www/rrd/CORE_mppt.rrd:Comm_Duration:AVERAGE \
CDEF:CORE_Comm_Duration0=CD0,1,*  \
LINE1:CORE_Comm_Duration0#ff0000:"CORE_mppt Communications Duration in Seconds" \
GPRINT:CORE_Comm_Duration0:LAST:"Last\:%2.2lf" \
GPRINT:CORE_Comm_Duration0:AVERAGE:"Avg\:%2.2lf" \
GPRINT:CORE_Comm_Duration0:MAX:"Max\:%2.2lf" \
GPRINT:CORE_Comm_Duration0:MIN:"Min\:%2.2lf\n" \
DEF:CD1=/var/www/rrd/LCCR_mppt.rrd:Comm_Duration:AVERAGE \
CDEF:LCCR_Comm_Duration1=CD1,1,*  \
LINE1:LCCR_Comm_Duration1#00ff00:"LCCR_mppt Communications Duration in Seconds" \
GPRINT:LCCR_Comm_Duration1:LAST:"Last\:%2.2lf" \
GPRINT:LCCR_Comm_Duration1:AVERAGE:"Avg\:%2.2lf" \
GPRINT:LCCR_Comm_Duration1:MAX:"Max\:%2.2lf" \
GPRINT:LCCR_Comm_Duration1:MIN:"Min\:%2.2lf\n" \
DEF:CD2=/var/www/rrd/MARC_mppt.rrd:Comm_Duration:AVERAGE \
CDEF:MARC_Comm_Duration2=CD2,1,*  \
LINE1:MARC_Comm_Duration2#0000ff:"MARC_mppt Communications Duration in Seconds" \
GPRINT:MARC_Comm_Duration2:LAST:"Last\:%2.2lf" \
GPRINT:MARC_Comm_Duration2:AVERAGE:"Avg\:%2.2lf" \
GPRINT:MARC_Comm_Duration2:MAX:"Max\:%2.2lf" \
GPRINT:MARC_Comm_Duration2:MIN:"Min\:%2.2lf\n" \
DEF:CD3=/var/www/rrd/TEST_mppt.rrd:Comm_Duration:AVERAGE \
CDEF:TEST_Comm_Duration3=CD3,1,*  \
LINE1:TEST_Comm_Duration3#ffff00:"TEST_mppt Communications Duration in Seconds" \
GPRINT:TEST_Comm_Duration3:LAST:"Last\:%2.2lf" \
GPRINT:TEST_Comm_Duration3:AVERAGE:"Avg\:%2.2lf" \
GPRINT:TEST_Comm_Duration3:MAX:"Max\:%2.2lf" \
GPRINT:TEST_Comm_Duration3:MIN:"Min\:%2.2lf\n"
