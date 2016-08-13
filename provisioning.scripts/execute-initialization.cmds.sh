#!/bin/bash

cd "$(dirname ${BASH_SOURCE[0]})"

## EXECUTING Commands ##
echo "START EXECUTING [Initialization] Provisioning Stage Commands.."

echo "Executing BashScript: enable-additional.repos.sh"
bash stage-initialization/enable-additional.repos.sh

echo "Executing BashScript: update-instance.timezone.sh"
bash stage-initialization/update-instance.timezone.sh

echo "Executing BashScript: enable-swap.memory.sh"
bash stage-initialization/enable-swap.memory.sh

echo "Executing BashScript: disable-selinux.service.sh"
bash stage-initialization/disable-selinux.service.sh

echo "Executing BashScript: install-java.sh"
bash stage-initialization/install-java.sh

echo "Executing BashScript: install-elasticsearch.sh"
bash stage-initialization/install-elasticsearch.sh

echo "FINISH EXECUTING [Initialization] Provisioning Stage Commands.."
