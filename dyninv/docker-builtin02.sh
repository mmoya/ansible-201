#!/bin/sh

ansible -i ~/src/ansible/plugins/inventory/docker.py all -m debug -a 'var=docker_state'
