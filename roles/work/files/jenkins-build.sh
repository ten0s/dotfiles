#!/bin/bash -e

# The below vars MUST be set
# JENKINS_URL
# JENKINS_FOLDER
# JENKINS_USERNAME
# JENKINS_API_TOKEN

# The below var CAN be set
# DEBUG=1

if [[ ! $(git branch 2> /dev/null) ]]; then
    echo "Not a git repository"
    exit 1
fi

if [[ ! -f Jenkinsfile ]]; then
    echo "No Jenkinsfile found"
    exit 1
fi

REPO=$(git remote get-url origin | sed -E -e 's#\.git$##' -e 's#(.*):(.*)/(.*)#\3#')
BRANCH=$(git branch --no-color | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
if [[ ${DEBUG} -ge 1 ]]; then
    echo "REPO   : ${REPO}"
    echo "BRANCH : ${BRANCH}"
fi

COMMAND="curl --silent -XPOST --user ${JENKINS_USERNAME?}:${JENKINS_API_TOKEN?} ${JENKINS_URL?}/job/${JENKINS_FOLDER?}/job/$REPO/job/$BRANCH/build"
if [[ ${DEBUG} -ge 1 ]]; then
    echo "COMMAND: ${COMMAND}"
fi

OUTPUT=$(${COMMAND})
if [[ ${DEBUG} -ge 1 ]]; then
    echo "OUTPUT : ${OUTPUT}"
fi

if [[ ! $(echo ${OUTPUT} | grep -i "error") ]]; then
    echo "Build scheduled"
else
    echo ${OUTPUT}
    exit 1
fi
