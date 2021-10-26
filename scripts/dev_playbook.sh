#!/bin/bash

#PLAY ANSIBLE BOOK
cd ansible-jobs
ls
sh 'ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook playbook/playdev.yml -i inventory/hosts/ec2.py --vault-password-file $ANSIBLE_VAULT_PASSWORD_FILE -vvvvv'