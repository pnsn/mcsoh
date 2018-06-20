#!/bin/bash 
rrdtool graph /var/www/assets/mcsoh/images/CommDura_graph.png \
-w 785 -h 120 -a PNG \
--slope-mode \
--start -2week --end now \
--font DEFAULT:7: \
--title "Round Trip Communication Duration" \
--watermark "`date`" \
--vertical-label "Seconds" \
--right-axis-label "Seconds" \
--lower-limit 0 \
--right-axis 1:0 \
--color CANVAS#000000 \
DEF:CD0=/var/www/rrd/BABR_mppt.rrd:Comm_Duration:AVERAGE \
CDEF:BABR_Comm_Duration0=CD0,1,*  \
LINE1:BABR_Comm_Duration0#ff0000:"BABR_mppt Communications Duration in Seconds" \
GPRINT:BABR_Comm_Duration0:LAST:"Last\:%2.2lf" \
GPRINT:BABR_Comm_Duration0:AVERAGE:"Avg\:%2.2lf" \
GPRINT:BABR_Comm_Duration0:MAX:"Max\:%2.2lf" \
GPRINT:BABR_Comm_Duration0:MIN:"Min\:%2.2lf\n" \
DEF:CD1=/var/www/rrd/LCCR_mppt.rrd:Comm_Duration:AVERAGE \
CDEF:LCCR_Comm_Duration1=CD1,1,*  \
LINE1:LCCR_Comm_Duration1#00ff00:"LCCR_mppt Communications Duration in Seconds" \
GPRINT:LCCR_Comm_Duration1:LAST:"Last\:%2.2lf" \
GPRINT:LCCR_Comm_Duration1:AVERAGE:"Avg\:%2.2lf" \
GPRINT:LCCR_Comm_Duration1:MAX:"Max\:%2.2lf" \
GPRINT:LCCR_Comm_Duration1:MIN:"Min\:%2.2lf\n" \
DEF:CD3=/var/www/rrd/YACT_mppt.rrd:Comm_Duration:AVERAGE \
CDEF:YACT_Comm_Duration3=CD3,1,*  \
LINE1:YACT_Comm_Duration3#ffff00:"YACT_mppt Communications Duration in Seconds" \
GPRINT:YACT_Comm_Duration3:LAST:"Last\:%2.2lf" \
GPRINT:YACT_Comm_Duration3:AVERAGE:"Avg\:%2.2lf" \
GPRINT:YACT_Comm_Duration3:MAX:"Max\:%2.2lf" \
GPRINT:YACT_Comm_Duration3:MIN:"Min\:%2.2lf\n" \
DEF:CD4=/var/www/rrd/FISH_mppt.rrd:Comm_Duration:AVERAGE \
CDEF:FISH_Comm_Duration4=CD4,1,*  \
LINE1:FISH_Comm_Duration4#990066:"FISH_mppt Communications Duration in Seconds" \
GPRINT:FISH_Comm_Duration4:LAST:"Last\:%2.2lf" \
GPRINT:FISH_Comm_Duration4:AVERAGE:"Avg\:%2.2lf" \
GPRINT:FISH_Comm_Duration4:MAX:"Max\:%2.2lf" \
GPRINT:FISH_Comm_Duration4:MIN:"Min\:%2.2lf\n"
