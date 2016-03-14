#!/usr/bin/env python2
# coding: utf-8

from __future__ import absolute_import, print_function, unicode_literals
import os
from pprint import pprint
import docker

docker_host = os.environ.get('DOCKER_HOST', 'unix://var/run/docker.sock')
cli = docker.Client(base_url=docker_host)

metadata = sorted([
    (
        ct['Names'][0][1:],
        ct['NetworkSettings']['Networks']['bridge']['IPAddress'],
        ct['Labels'],
    )
    for ct in cli.containers()
])

pprint(metadata)
