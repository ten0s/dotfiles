#!/bin/bash -e

BROWSER="bash -c 'mfakeys --login %s || true'" aws sso login --profile Sandbox
export AWS_PROFILE=Sandbox
exec /bin/bash
