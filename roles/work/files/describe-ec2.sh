#!/bin/bash -e

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename $0) <IP>"
    exit 1
fi

IP="$1"
JSON=$(ssh $IP 'curl -s http://169.254.169.254/latest/dynamic/instance-identity/document/')
InstanceId=$(echo ${JSON} | jq -r .instanceId)
Region=$(echo ${JSON} | jq -r .region)

echo "Describing ${IP} (${InstanceId} in ${Region})"
aws ec2 describe-instances --instance-ids ${InstanceId} --region ${Region}
