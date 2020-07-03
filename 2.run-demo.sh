#!/bin/bash
set -e
set -x

echo "starting demo..."
echo

#create model
cd ~/scylladb-spark-demo/scylladb-docker
sudo ../scylladb-samples/streaming-into-scylla/create-tables.sh
cd ~/

sleep 3

cd ~/scylladb-spark-demo/scylladb-samples/streaming-into-scylla/
python streamer.py &
cd ~/

cd ~/scylladb-spark-demo/scylladb-spark
sudo docker-compose -p scylla exec spark-master spark-submit \
    --class com.scylladb.streaming.Streaming \
    --master spark://spark-master:7077 \
    --conf spark.scylla.quotes=aapl,fb,snap,tsla,amzn \
    /jars/streaming-into-scylla-assembly-0.0.1.jar
cd ~/

sleep 3

echo
echo "done."