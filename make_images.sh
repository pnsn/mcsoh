#!/bin/bash
#./CommDurationgraph.sh
for sta in LCCR MARC; do
echo $sta 
./vgraph.sh $sta
./igraph.sh $sta
./tgraph.sh $sta
./cgraph.sh $sta
./vbatt-lvd_graph.sh $sta
done
