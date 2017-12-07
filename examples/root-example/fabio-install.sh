#!/bin/bash

set -e

/opt/consul/bin/run-consul --client --cluster-tag-key "${cluster_tag_key}" --cluster-tag-value "${cluster_tag_value}"

wget https://github.com/fabiolb/fabio/releases/download/v1.1.2/fabio-1.1.2-go1.6.2_linux-amd64
sudo chmod +x fabio-1.1.2-go1.6.2_linux-amd64
sudo mv fabio-1.1.2-go1.6.2_linux-amd64 fabio