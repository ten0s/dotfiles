#!/bin/bash -e

# The below vars MUST be set in ~/.bashrc.local
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
JOB_URL=${JENKINS_URL?}/job/${JENKINS_FOLDER?}/job/${REPO}/job/${BRANCH}
if [[ ${DEBUG} -ge 1 ]]; then
    echo "REPO   : ${REPO}"
    echo "BRANCH : ${BRANCH}"
    echo "JOB URL: ${JOB_URL}"
fi

COMMAND="curl --silent --include -XPOST --user ${JENKINS_USERNAME?}:${JENKINS_API_TOKEN?} ${JOB_URL}/build"
if [[ ${DEBUG} -ge 1 ]]; then
    echo "COMMAND: ${COMMAND}"
fi

OUTPUT=$(${COMMAND})
if [[ ${DEBUG} -ge 1 ]]; then
    echo "OUTPUT : ${OUTPUT}"
fi

if [[ $(echo ${OUTPUT} | grep -i "201 Created") ]]; then
    echo "Job scheduled"
    curl --silent ${JOB_URL}/api/json | jq -r .lastBuild.url
else
    echo "Job scheduling error"
    echo ${OUTPUT}
    exit 1
fi
