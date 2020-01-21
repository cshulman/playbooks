#!/bin/bash

################
# Default Vars
################
unset CLUSTERNAME 
unset AWSKEY 
unset AWSSECRETKEY
unset REGION


#############
# Functions
#############
usage () {
  echo "Usage: $0 -c <clustername> -k <aws access key> -s <aws secret key> -r <aws region>"
  echo "Missing parameters:"
  
  [ -z "${CLUSTERNAME}" ] && echo "CLUSTERNAME: <${CLUSTERNAME}>"
  [ -z "${AWSKEY}" ] && echo "AWSKEY: <${AWSKEY}>"
  [ -z "${AWSSECRETKEY}" ] && echo "AWSSECRETKEY: <${AWSSECRETKEY}>"
  [ -z "${REGION}" ] && echo "REGION: <${REGION}>"
}

#############
# Arguments
#############
while getopts ":k:s:c:r:" opt; do
  case ${opt} in
    c ) # Clustername
      export CLUSTERNAME=$OPTARG
      ;;
    k ) # AWS Access Key
      export AWSKEY=$OPTARG
      ;;
    s ) # AWS Secret Key
      export AWSSECRETKEY=$OPTARG
      ;;
    r ) # AWS Region
      export REGION=$OPTARG
      ;;
    \? )
      usage
      ;;
  esac
done
shift $((OPTIND -1))

if [ -z "${CLUSTERNAME}" -o -z "${AWSKEY}" -o -z "${AWSSECRETKEY}" -o -z "${REGION}" ]; then
  usage
else
  # remove dir if it exists and recreate it
  rm -rf ${HOME}/.aws
  mkdir ${HOME}/.aws

# Create aws credentials file
cat << EOF >>  ${HOME}/.aws/credentials
[default]
aws_access_key_id = ${AWSKEY}
aws_secret_access_key = ${AWSSECRETKEY}
region = ${REGION}
EOF

# Add sone environment variables to .bashrc
cat << EOF >>  ${HOME}/.bashrc
export CLUSTERNAME=${CLUSTERNAME}
export KUBECONFIG=${HOME}/${CLUSTERNAME}/auth/kubeconfig
EOF

  # Add the environment variables to current environment
  export CLUSTERNAME=${CLUSTERNAME}
  export KUBECONFIG=${HOME}/${CLUSTERNAME}/auth/kubeconfig

  # Test the new credential file
  echo "Testing aws credentials"
  aws sts get-caller-identity
  cat ${HOME}/.aws/credentials

  # Create a new ssh key
  echo "Generating ssh"
  ssh-keygen -f ~/.ssh/cluster-${CLUSTERNAME}-key -N ''

  echo "Done with all of the things"
fi
