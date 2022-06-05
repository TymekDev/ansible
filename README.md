## Installation
```bash
ansible-playbook --ask-become-pass main.yaml
```

## Dependencies
### Ubuntu 22.04 (Jammy Jellyfish)
```bash
sudo apt install -y software-properties-common
sudo apt-add-repository -yu ppa:ansible/ansible
sudo apt install -y ansible
```

### Debian 11 (Bullseye)
```bash
sudo apt install -y software-properties-common
sudo add-apt-repository -yu 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu focal main'
sudo apt install -y ansible
```
[Reference](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-debian)
