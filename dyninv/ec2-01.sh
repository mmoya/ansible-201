#!/bin/sh

ansible() {
    /usr/bin/env ansible "$@" | sed -r 's/^ *[0-9]+\.[0-9]+/xx.xx/'
}

echo "instance type is t2.micro"
ansible -i ~/src/ansible/plugins/inventory/ec2.py --list type_t2_micro

echo "instance name is vpngw"
ansible -i ~/src/ansible/plugins/inventory/ec2.py --list tag_Name_vpngw

echo "has security-group called admin-server"
ansible -i ~/src/ansible/plugins/inventory/ec2.py --list security_group_admin-server

echo "t2.micro with sg admin-server"
ansible -i ~/src/ansible/plugins/inventory/ec2.py --list --limit type_t2_micro security_group_admin-server

echo "t2.micro in az eu-west-1c"
ansible -i ~/src/ansible/plugins/inventory/ec2.py --list --limit 'type_t2_micro:&eu-west-1c' all
