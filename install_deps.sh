#!/bin/bash

set -e

os_family=$(lsb_release --id --short)

if [[ $os_family -ne "Debian" ]]; then
  echo "Unsupported OS family ($os_family)"
  exit 1
fi

os_codename=$(lsb_release --codename --short)

case "$os_codename" in
  "bullseye")
    # Reference: https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-debian
    repo="deb http://ppa.launchpad.net/ansible/ansible/ubuntu focal main"
  ;;
  "focal")
    repo="ppa:ansible/ansible"
  ;;
  *)
    echo "Unsupported OS codename ($os_codename)"
    exit 1
  ;;
esac

sudo apt install -y -qq software-properties-common
sudo add-apt-repository -yu "$repo"
sudo apt install -y -qq ansible
pip3 install github3.py # TODO: this could be handled by ansible
ansible-galaxy collection install community.general
