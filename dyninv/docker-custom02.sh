#!/bin/sh

echo "madrid 01"
ansible -i dyninv/docker-custom.py --list mad01

echo "backend hosts"
ansible -i dyninv/docker-custom.py --list backend

echo "frontend hosts in berlin 03"
ansible -i dyninv/docker-custom.py --list --limit ber03 frontend

echo "stats hosts in paris 02"
ansible -i dyninv/docker-custom.py --list --limit 'stats:&par02' all

echo "instances from 1 to 5"
ansible -i dyninv/docker-custom.py --list --limit '~instance0[1-5]' all
