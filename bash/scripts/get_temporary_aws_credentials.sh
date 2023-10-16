#!/bin/bash
# To use this, in the AWS profile YAML config, place the following lines
#
# [dds-chhongr]
# credential_process = sh -c "/home/ryanc/get_temporary_aws_credentials.sh <2fa-device-arn> 2> /dev/tty"

read -p "2FA Code: " -n 6 -r
aws sts get-session-token --serial-number $1 --token-code $REPLY --output json | jq --monochrome-output '.Credentials += {"Version": 1} | .Credentials'
