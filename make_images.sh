#!/bin/bash
#./CommDurationgraph.sh
/bin/bash -l -c "/home/deploy/mcsoh/CommDurationgraph.sh"
for sta in CORE LCCR MARC TEST YACT; do
echo $sta 
/bin/bash -l -c "/home/deploy/mcsoh/vgraph.sh ${sta}"
/bin/bash -l -c "/home/deploy/mcsoh/igraph.sh ${sta}"
/bin/bash -l -c "/home/deploy/mcsoh/tgraph.sh ${sta}"
/bin/bash -l -c "/home/deploy/mcsoh/cgraph.sh ${sta}"
/bin/bash -l -c "/home/deploy/mcsoh/vbatt-lvd_graph.sh ${sta}"
done
