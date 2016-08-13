#!/bin/bash

cd "$(dirname ${BASH_SOURCE[0]})"

## EXECUTING Commands ##
echo "START EXECUTING [Configuration] Provisioning Stage Commands.."

echo "Executing BashScript: configure-elasticsearch.sh"
bash stage-configuration/configure-elasticsearch.sh

echo "FINISH EXECUTING [Configuration] Provisioning Stage Commands.."
