#!/bin/bash

# The below vars MUST be set in ~/.bashrc.local
# AWS_PROD_ACCOUNT_ID
# AWS_PROD_POWER_USER

mfakeys -a ${AWS_PROD_ACCOUNT_ID?} -p ${AWS_PROD_POWER_USER?}
