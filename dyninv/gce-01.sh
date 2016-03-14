#!/bin/sh

ansible() {
    /usr/bin/env ansible "$@" | sed -r 's/^ *[0-9]+\.[0-9]+/xx.xx/'
}

echo "instance type is n1-standard-1"
ansible -i ~/src/ansible/plugins/inventory/gce.py --list n1-standard-1

echo "instance is located in az europe-west1-a"
ansible -i ~/src/ansible/plugins/inventory/gce.py --list europe-west1-a

echo "instance have tag backend"
ansible -i ~/src/ansible/plugins/inventory/gce.py --list tag_backend

echo "backend hosts in europe-west1-a"
ansible -i ~/src/ansible/plugins/inventory/gce.py --list --limit europe-west1-a tag_backend
