#!/usr/bin/env python
# coding: utf-8

from __future__ import absolute_import, print_function, unicode_literals
import json
import sys

INVENTORY = {
    '_meta': {'hostvars': {}},
}

if sys.argv[1] == '--list':
    json.dump(INVENTORY, sys.stdout, indent=2)
    sys.stdout.write('\n')
