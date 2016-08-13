#!/bin/bash

service elasticsearch status

cat <<EOT >> /etc/elasticsearch/elasticsearch.yml
#
# ----------------------------- my Configurations -----------------------------
#

# Elastica Node Name
node.name: myelastica-node-x
# Elastica Cluster Name
cluster.name: myelastica-cluster-x

# Is this Node an Elastica Master Node?
node.master: true
# Is this Node an Elastica Slave/Data Node?
node.data: true

# Number of Shards for this Elastica Cluster
index.number_of_shards: 1
# Number of Replicas per Shard for this Elastica Cluster
index.number_of_replicas: 0

# From which Network is this Elastica Cluster Accessible?
network.host: 0.0.0.0
# From which Port is this Elastica Cluster Accessible?
http.port: 9200

# Where to store ElasticSearch Data Files?
path.data: /var/lib/elasticsearch
# Where to store ElasticSearch Log Files?
path.logs: /var/log/elasticsearch

EOT

service elasticsearch restart
service elasticsearch status
