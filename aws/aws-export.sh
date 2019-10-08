#!/bin/bash

export CLUSTERNAME=CLUSTERNAME
export AWSKEY=YOURACCESSKEY
export AWSSECRETKEY=YOURSECRETKEY
export REGION=us-east-2


#remove dir if it exists
rm -rf $HOME/.aws

mkdir $HOME/.aws

cat << EOF >>  $HOME/.aws/credentials
[default]
aws_access_key_id = ${AWSKEY}
aws_secret_access_key = ${AWSSECRETKEY}
region = $REGION
EOF

echo "Testing aws credentials"
aws sts get-caller-identity
cat $HOME/.aws/credentials


echo "Generating ssh"
ssh-keygen -f ~/.ssh/cluster-${CLUSTERNAME}-key -N ''

echo "Done with all of the things"
