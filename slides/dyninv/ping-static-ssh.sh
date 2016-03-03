#!/bin/sh

ctids=`dyninv/ping-static-only-ids.sh`
ansible -i $ctids all -m ping
