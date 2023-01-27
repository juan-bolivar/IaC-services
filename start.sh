#!/bin/bash

source config.ini

function terraform_run(){

	cd terraform-webpage
	terraform init 
	terraform plan -var "do_region=$do_region" -var "server=$server" -var "do_token=$do_token" -var "pvt_key=$pvt_key" 
	terraform apply -var "do_region=$do_region" -var "server=$server" -var "do_token=$do_token" -var "pvt_key=$pvt_key" 
	terraform output > output.txt
	cd ..
}

function ansible_run(){
	cd terraform-webpage 
	ipv4_webpage="$(cat output.txt | sed 's/ipv4_webpage = //' | sed 's/"//g')" 
	echo "$ipv4_webpage"
	cd .. && cd webpage
	sleep 120
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u root -i "$ipv4_webpage," -e "server=$server"  main.yaml
	cd ..
}

terraform_run
ansible_run
