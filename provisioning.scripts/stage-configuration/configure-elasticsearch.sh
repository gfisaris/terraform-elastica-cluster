#!/bin/bash

service elasticsearch status

cat <<EOT >> /etc/elasticsearch/elasticsearch.yml
#
# ----------------------------- my Configurations -----------------------------
#

# Elastica Node Name
node.name: "my Elastica Node X"
# Elastica Cluster Name
cluster.name: myElastica-Cluster-X

# Is this Node an Elastica Master Node?
node.master: true
# Is this Node an Elastica Slave/Data Node?
node.data: true

# Number of Shards for this Elastica Cluster
index.number_of_shards: 1
# Number of Replicas per Shard for this Elastica Cluster
index.number_of_replicas: 0

# From which Network is this Elastica Cluster Accessible?
network.bind_host: 0.0.0.0	

EOT

service elasticsearch restart
service elasticsearch status
