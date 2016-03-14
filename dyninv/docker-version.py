#!/usr/bin/env python2
# coding: utf-8

from __future__ import absolute_import, print_function, unicode_literals
import os
import docker

docker_host = os.environ.get('DOCKER_HOST', 'unix://var/run/docker.sock')
cli = docker.Client(base_url=docker_host)

from pprint import pprint
pprint(cli.version())
