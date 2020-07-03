#!/bin/bash

set -e
set -x

docker-compose -p scylla exec scylladb-node1 cqlsh -e "DROP KEYSPACE IF EXISTS quotes;"
docker-compose -p scylla exec scylladb-node1 cqlsh -e "CREATE KEYSPACE quotes WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor': 1};"
docker-compose -p scylla exec scylladb-node1 cqlsh -e "CREATE TABLE quotes.quotes (symbol TEXT, timestamp TIMESTAMP, day TIMESTAMP, latest_price DOUBLE, previous_close DOUBLE, latest_volume BIGINT, PRIMARY KEY ((symbol), timestamp));"
docker-compose -p scylla exec scylladb-node1 cqlsh -e "CREATE MATERIALIZED VIEW quotes.quotes_by_day AS SELECT * FROM quotes.quotes WHERE day IS NOT NULL AND symbol IS NOT NULL AND timestamp IS NOT NULL PRIMARY KEY ((day), symbol, timestamp)"
