#!/bin/bash

# backup exisiting vagrant insecure public key
if [ -f ${HOME}/.ssh/authorized_keys ]; then
    cat ${HOME}/.ssh/authorized_keys | grep "vagrant insecure public key" > ${HOME}/.ssh/insecure_public_key
    rm ${HOME}/.ssh/authorized_keys
    chmod 600 ${HOME}/.ssh/insecure_public_key
fi

# recreate authorized_keys
touch ${HOME}/.ssh/authorized_keys
chmod 600 ${HOME}/.ssh/authorized_keys

if [ -f ${HOME}/.ssh/insecure_public_key ]; then
    cat ${HOME}/.ssh/insecure_public_key >> ${HOME}/.ssh/authorized_keys
    chmod 600 ${HOME}/.ssh/insecure_public_key
fi

if [ -f /tmp/public_key ]; then
    cat /tmp/public_key >> ${HOME}/.ssh/authorized_keys
    rm /tmp/public_key
fi

if [ -f /tmp/private_key ]; then
    cp /tmp/private_key ${HOME}/.ssh/id_rsa
    chmod 600 ${HOME}/.ssh/id_rsa
    rm /tmp/private_key
fi
