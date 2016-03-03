#!/usr/bin/env python2
# coding: utf-8

from __future__ import absolute_import, print_function, unicode_literals
import os
import random
import docker

docker_host = os.environ.get('DOCKER_HOST', 'unix://var/run/docker.sock')
cli = docker.Client(base_url=docker_host)

DATACENTERS = ('mad01', 'par02', 'ber03')
SERVICES = ('frontend', 'backend', 'stats')

for i in range(20):
    ct = cli.create_container(
        image='frolvlad/alpine-python2',
        command="sleep 8h",
        detach=True,
        name='instance{:02d}'.format(i + 1),
        labels={
            'datacenter': random.choice(DATACENTERS),
            'service': random.choice(SERVICES),
        }
    )
    cli.start(container=ct['Id'])
