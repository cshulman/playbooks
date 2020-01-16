#!/bin/bash

####################################################
# VARS
####################################################
newuser=false
create=false
dryrun=false

####################################################
# SCRIPT BODY
####################################################

#############
# Arguments
#############
while getopts ":u:p:d" opt; do
  case ${opt} in
    d ) # Dry run, do not create a login profile or console-details file
      dryrun=true
      ;;
    u ) # take a user
      AWSUSER=$OPTARG
      newuser=true
      ;;
    p ) # take password
      AWSPASS=$OPTARG
      newuser=true
      ;;
    \? ) echo "Usage: cmd [-u <email-gui>] [-p <passwd>] [-d]"
      ;;
  esac
done
shift $((OPTIND -1))

if [ -f ~/.aws/console-details -a "${newuser}" = "false" ]; then
  eval $(awk '/UserName/{print "export AWSUSER=" $2}; /Password/{print "export AWSPASS=" $2}' .aws/console-details)
fi

if [ -z ${AWSUSER} ]; then read -p "Please enter [email]-[GUID] (you@redhat.com-1p6e): " AWSUSER; fi
if [ -z ${AWSPASS} ]; then read -p "Please enter a password to use: " AWSPASS; fi
if [ "${newuser}" = "true"  -a "${dryrun}" = "false" ]; then
  read -p "[CONFIRMATION]: Create login profile? [y/n]: " create
  case ${create} in
    y|Y|yes|Yes )
      aws iam create-login-profile --user-name ${AWSUSER} --password ${AWSPASS} --no-password-reset-required
      ;;
  esac
fi


details=$(aws iam get-user --query 'User.Arn'|awk -F\: '{
  split($6, a, "/");
  split(a[2], user, "\"");
  print "UserID:", $5 "\nUserName:", user[1] "\nPassword: '${AWSPASS}'\nConsole Signing URL: https://" $5 ".signin.aws.amazon.com/console/"
}')
echo -e "${details}"
if [ "${newuser}" = "true" -a ! -f ~/.aws/console-details -a "${dryrun}" = "false" ]; then
  echo -en "\n\nWriting details to .aws/console-details... "
  echo -e "${details}" >> .aws/console-details
  echo "Done"
fi
