#!/bin/bash -e

# The below vars are expected to be set
# JENKINS_URL
# JENKINS_FOLDER
# JENKINS_USERNAME
# JENKINS_API_TOKEN

if [[ ! $(git branch 2> /dev/null) ]]; then
    echo "Not a git repository"
    exit 1
fi

if [[ ! -f Jenkinsfile ]]; then
    echo "No Jenkinsfile found"
    exit 1
fi

REPO=$(git remote get-url origin | sed -E 's#(.*):(.*)/(.*).git#\3#')
BRANCH=$(git branch --no-color | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')

OUTPUT=$(curl --silent -XPOST --user ${JENKINS_USERNAME?}:${JENKINS_API_TOKEN?} ${JENKINS_URL?}/job/${JENKINS_FOLDER?}/job/$REPO/job/$BRANCH/build)
if [[ ! $(echo ${OUTPUT} | grep -i "error") ]]; then
    echo "Build scheduled"
else
    echo ${OUTPUT}
    exit 1
fi
