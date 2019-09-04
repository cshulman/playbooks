#!/bin/bash

export GUID=GUID
export AWSKEY=YOURACCESSKEY
export AWSSECRETKEY=YOURSECRETKEY
export REGION=us-east-2

mkdir $HOME/.aws

cat << EOF >>  $HOME/.aws/credentials
[default]
aws_access_key_id = ${AWSKEY}
aws_secret_access_key = ${AWSSECRETKEY}
region = $REGION
EOF


aws sts get-caller-identity
cat $HOME/.aws/credentials

echo "done with all the things"
