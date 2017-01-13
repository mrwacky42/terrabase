#!/bin/bash

set -e

[[ $1 = "check" ]] && { echo "Terrabase Terraform Helper Script Version: 0.1" ; exit 0 ; }

DATE=${DATE:-$(date +%D)}
export TF_VAR_username=$USER
export TF_VAR_date="$DATE"

# this file is next to the Makefile being run, so this is the correct path:
source ./environment.sh

exec terragrunt "$@"
