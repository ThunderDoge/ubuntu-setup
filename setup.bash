#!/usr/bin/bash
DISTRO=$(lsb_release -cs)   # ubuntu distribution name.
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd ) # script directory absolute.
SYS_SOURCE=/etc/apt/sources.list
SYS_SOURCE_BAK=$SYS_SOURCE.bak
USR_SOURCE=./sources/$DISTRO.list

# change working directory to where script is.
cd $SCRIPT_DIR

if [ -f $USR_SOURCE ]
then
    # replace sources.list with user's .list.
    sudo cp $SYS_SOURCE $SYS_SOURCE_BAK &&
    sudo cp $USR_SOURCE $SYS_SOURCE &&
    echo "Source file applied."
else
    echo "User source file do not exist."
fi

SYS_ALIAS=~/.bash_aliases
USR_ALIAS=./aliases/aliases

# add user aliases to bash aliases file.
if [ -f ./aliases/aliases ]
then
    cat $USR_ALIAS >> $SYS_ALIAS
    echo "User alias applied."
else
    echo "User aliases do not exist."
fi