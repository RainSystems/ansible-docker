#!/bin/sh

if [ -d "/ssh" ]; then
    cp -r /ssh /root/.ssh;
    chmod 0700 -R /root/.ssh;
    chown -R root.root /root/.ssh;
fi

if [ -n "${EC2_INV}" ]; then
    export ANSIBLE_HOSTS="/app/config/ec2.py"
elif [ -n "`ls *.hosts`" ]; then
    export ANSIBLE_HOSTS="$PWD/`ls *.hosts`"
fi;

if [ -n "${DEBUG}" ]; then
    /bin/sh
elif [ -n "${EC2}" ]; then
    ./config/ec2.py $@
elif [ -n "${PLAYBOOK}" ]; then
    ansible-playbook "$@"
else
    ansible $@
fi