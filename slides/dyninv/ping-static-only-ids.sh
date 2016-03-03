#!/bin/sh

docker ps -q --filter name=instance | paste -s -d,
