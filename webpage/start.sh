#!/bin/bash 

pip_install(){

	echo 'Downloading pip'
	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	python3 get-pip.py
	echo 'Installing ansible'
	python3 -m pip install ansible

}
ansible_run(){

	echo 'Runing Ansible'
	ansible-playbook main.yaml

}



pip_install
ansible_run

