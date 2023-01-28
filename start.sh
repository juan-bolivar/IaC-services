#!/bin/bash

source config.ini

function terraform_run(){
	pushd terraform
	terraform init 
	terraform plan  -var "do_region=$do_region" -var "server=$server" -var "do_token=$do_token" -var "pvt_key=$pvt_key" 
	terraform apply   -var "do_region=$do_region" -var "server=$server" -var "do_token=$do_token" -var "pvt_key=$pvt_key" 
	terraform output > output.txt
	popd
}


check_dns(){

	ipv4_webpage="$(cat terraform/output.txt | sed 's/ipv4_webpage = //' | sed 's/"//g')" 
	DNS_IP_OBJECTIVE=$ipv4_webpage
	DNS_IP=""
	COUNTER=0

	while [  "$DNS_IP" !=  "$DNS_IP_OBJECTIVE" ] && [ $COUNTER -lt 300 ]; do
  		DNS_IP=$(nslookup $1 | awk '/^Address: / { print $2 }')
		echo "$DNS_IP"
		echo "$DNS_IP_OBJECTIVE"
  		sleep 1
  		((COUNTER++))
		echo "Waiting for DNS to be available $COUNTER seconds"
	done
	[  "$DNS_IP" != "$DNS_IP_OBJECTIVE" ] && echo "timeout" || echo $DNS_IP 
}

function ansible_run(){
	ipv4_webpage="$(cat terraform/output.txt | sed 's/ipv4_webpage = //' | sed 's/"//g')" 
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u root -i "$ipv4_webpage," -e "server=$server"  ansible/main.yaml
}

terraform_run
check_dns $server
ansible_run
