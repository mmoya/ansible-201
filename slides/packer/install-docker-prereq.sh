#!/bin/sh

set -e

sudo apt-get update
sudo apt-get -y --no-install-recommends install apt-transport-https aptitude software-properties-common
sudo useradd ubuntu
