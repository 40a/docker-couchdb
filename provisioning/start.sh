#!/bin/sh -e

if [ "$CONTAINER_TEST" = true ]; then
    ansible-playbook container.yml --tags "deploy"
    ansible-playbook container.yml --tags "test"
else
    ansible-playbook container.yml --tags "deploy"
    supervisord -c /etc/supervisord.conf
fi
