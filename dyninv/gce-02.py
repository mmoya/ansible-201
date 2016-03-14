#!/usr/bin/env python
# coding: utf-8

from __future__ import absolute_import, division, print_function, unicode_literals
from pprint import pprint

from googleapiclient.discovery import build
from oauth2client.client import GoogleCredentials

def get_instances(credentials_file, project_id):
    credentials = GoogleCredentials.from_stream(credentials_file)
    compute = build('compute', 'v1', credentials=credentials)

    instances = []
    for zone in ['us-east1-{}'.format(az) for az in 'bcd']:
        query = compute.instances().list(project=project_id, zone=zone)
        result = query.execute()
        zone_instances = result.get('items', [])
        instances.extend(zone_instances)

    return instances

if __name__ == '__main__':
    # a file with two lines
    #   path to secrets.json
    #   project id
    with open('dyninv/gce-02.secrets') as f:
        lines = f.readlines()

    credentials_file = lines[0].strip()
    project_id = lines[1].strip()

    instances = get_instances(credentials_file, project_id)
    pprint([
        (instance['id'], instance['name'], instance['status'])
        for instance in instances
    ])
