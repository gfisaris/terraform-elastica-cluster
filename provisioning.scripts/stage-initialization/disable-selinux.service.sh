#!/bin/bash

echo "Disabling SELinux.."

sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
setenforce 0
