#!/usr/bin/bash
EMAIL=$1
if [ ! $# -gt 0 ]
then
    echo "Email unspecified."
    exit 2
fi

eval $(ssh-agent) &> /dev/null

KEYFILE=~/.ssh/id_ed25519
if [ ! -f $KEYFILE ]
then
    PASSPHRASE=""
    # generate ssh key using ed25519, comments=$EMAIL and passphrase="" to ~/.ssh/id_ed25519
    ssh-keygen -t ed25519 -C "$EMAIL" -f $KEYFILE -N "$PASSPHRASE"
fi
ssh-add $KEYFILE
