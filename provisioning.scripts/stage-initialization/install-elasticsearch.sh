#!/bin/bash

echo "Installing ElasticSearch v2.3.5.."

rpm -Uvh https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/rpm/elasticsearch/2.3.5/elasticsearch-2.3.5.rpm

systemctl enable elasticsearch.service
systemctl start elasticsearch.service
service elasticsearch status
