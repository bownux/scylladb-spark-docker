#!/bin/bash
set -e
set -x

#scylla cluster
cd ~/scylladb-spark-demo/scylladb-docker
sudo docker-compose -p scylla down --remove-orphans
cd ~/

#spark cluster
cd ~/scylladb-spark-demo/scylladb-spark
sudo docker-compose -p scylla down --remove-orphans
cd ~/

#kafka/zookeeper cluster
cd ~/scylladb-spark-demo/scylladb-kafka
sudo docker-compose -p scylla down --remove-orphans
cd ~/
