#!/bin/bash  
if [ $1 ]
  then 
  sta=$1
else
  echo must provide station  as first argument
  exit
fi

rrdtool graph /var/www/assets/mcsoh/images/${sta}_Charge_m_State_graph.png \
-w 785 -h 20 -a PNG \
--slope-mode \
--start -2month --end now \
--font DEFAULT:7: \
--watermark "`date`" \
--vertical-label " $sta" \
--right-axis-label " $sta" \
--upper-limit 1 \
--lower-limit 5 \
--rigid \
--color CANVAS#000000 \
DEF:Charge_State=/var/www/rrd/${sta}_mppt.rrd:Charge_State:AVERAGE \
CDEF:CS=Charge_State \
CDEF:Start=CS,0,EQ,CS,0,IF \
AREA:Start#0099ff:"Start" \
CDEF:Night_Check=CS,1,EQ,CS,0,IF \
AREA:Night_Check#660066:"Night_Check" \
CDEF:Disconnect=CS,2,EQ,CS,0,IF \
AREA:Disconnect#990000:"Disconnect" \
CDEF:Night=CS,3,EQ,CS,0,IF \
AREA:Night#555555:"Night" \
CDEF:Fault=CS,4,EQ,CS,0,IF \
AREA:Fault#ff0000:"Fault" \
CDEF:Bulk_Charge=CS,5,EQ,CS,0,IF \
AREA:Bulk_Charge#ff9900:"Bulk_Charge" \
CDEF:Absorption=CS,6,EQ,CS,0,IF \
AREA:Absorption#ffff00:"Absorption" \
CDEF:Float=CS,7,EQ,CS,0,IF \
AREA:Float#00ff00:"Float" \
CDEF:Equalize=CS,8,EQ,CS,0,IF \
AREA:Equalize#ff00ff:"Equalize\c" 
