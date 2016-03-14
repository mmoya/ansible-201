#!/bin/sh

docker ps -aq -f name=instance | xargs -r docker rm -f
