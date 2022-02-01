#!/bin/bash

# The below vars MUST be set in ~/.bashrc.local
# AWS_SANDBOX_ACCOUNT_ID
# AWS_SANDBOX_POWER_USER

mfakeys -a ${AWS_SANDBOX_ACCOUNT_ID?} -p ${AWS_SANDBOX_POWER_USER}
