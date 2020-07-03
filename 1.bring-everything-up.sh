#!/bin/bash
set -e
set -x

echo "starting..."
echo

sudo setenforce 0
sudo mkdir -p /var/lib/scylla/data /var/lib/scylla/commitlog

sleep 1

#scylla cluster
cd ~/scylladb-spark-demo/scylladb-docker
sudo docker-compose -p scylla up -d
sleep 3
sudo docker-compose -p scylla logs scylladb-node1
sleep 60
sudo docker-compose -p scylla exec scylladb-node1 nodetool status || echo
cd ~/

sleep 3

#spark cluster
cd ~/scylladb-spark-demo/scylladb-spark
sudo docker-compose -p scylla up -d
cd ~/

sleep 10

#kafka/zookeeper cluster
cd ~/scylladb-spark-demo/scylladb-kafka
sudo docker-compose -p scylla up -d
cd ~/

sleep 10

cd ~/scylladb-spark-demo/scylladb-docker
sudo docker-compose -p scylla exec scylladb-node1 nodetool status || echo
cd ~/

echo
echo "done."