#!/bin/bash -e

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename $0) <IP>"
    exit 1
fi

IP="$1"
EC2=$(ssh $IP 'curl -s http://169.254.169.254/latest/meta-data/instance-id')
echo "Terminating $IP ($EC2)"
aws ec2 terminate-instances --instance-ids $EC2
