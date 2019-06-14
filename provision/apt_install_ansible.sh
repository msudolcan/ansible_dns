#!/usr/bin/env bash

echo "Waiting 2.5 minutes for the lock to become available for apt"
sleep 180

echo "------------------------------------------------------------"
echo "-  Updating apt.."
sudo apt update

echo "------------------------------------------------------------"
echo "- Installing software-properties-common"
sudo apt install software-properties-common -y

echo "------------------------------------------------------------"
echo "- Adding ansible repository.."
sudo apt-add-repository --yes --update ppa:ansible/ansible

echo "------------------------------------------------------------"
echo "- Installing ansible.."
sudo DEBIAN_FRONTEND=noninteractive apt install ansible -y

echo "------------------------------------------------------------"
echo "- Running ansible playbook: prep_ansible_host.yaml"
cd /vagrant/provision/ansible
ansible-playbook prep_ansible_host.yaml