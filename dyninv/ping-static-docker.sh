#!/bin/sh

ctids=`docker ps -q --filter name=instance | paste -s -d,`
ansible -i $ctids -c docker all -m ping
