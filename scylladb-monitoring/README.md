# Scylla Monitoring

Please follow the instructions here: https://docs.scylladb.com/operating-scylla/monitoring/

To make the monitoring work with the demo if you are running scylladb in docker, you must add `--network scylla_scylla-net` to each script that has `docker run`, ie `docker run --network scylla_scylla-net ...`. 