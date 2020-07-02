#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename $0) <ssh://[USER@]HOST[:PORT]>"
    echo "Warning: The gvfs takes precedence if sftp:// is handled over ssh://"
    echo "Remove SchemeAliases=ssh in /usr/share/gvfs/mounts/sftp.mount to prevent it"
    exit 1
fi

URI="$1"
USER=$(echo $URI | sed -rn 's;ssh://(.*)@.*;\1;p')
HOST=$(echo $URI | sed -rn 's;ssh://(.*@)?([^:]*)(:.*)?;\2;p')
PORT=$(echo $URI | sed -rn 's;ssh://(.*@)?(.*):(.*);\3;p')

echo "URI : $URI"
echo "USER: $USER"
echo "HOST: $HOST"
echo "PORT: $PORT"

if [[ ! -z $USER ]]; then
    USER="$USER@"
fi

if [[ ! -z $PORT ]]; then
    PORT="-p $PORT"
fi

ssh $PORT $USER$HOST
