#!/usr/bin/env python2
# coding: utf-8

from __future__ import absolute_import, print_function, unicode_literals
import json
import os
import sys
import docker

docker_host = os.environ.get('DOCKER_HOST', 'unix://var/run/docker.sock')
cli = docker.Client(base_url=docker_host)

INVENTORY = {
    '_meta': {'hostvars': {}},
}

if sys.argv[1] == '--list':
    for ct in cli.containers():
        for group_name in ct['Labels'].values():
            group = INVENTORY.setdefault(group_name, [])
            group.append(ct['Names'][0][1:])

    json.dump(INVENTORY, sys.stdout, indent=2)
    sys.stdout.write('\n')
