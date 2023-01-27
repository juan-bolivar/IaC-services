#!/bin/bash

source config.ini

function terraform_destroy(){

	cd terraform-webpage
	terraform destroy -var "do_region=$do_region" -var "server=$server" -var "do_token=$do_token" -var "pvt_key=$pvt_key" 
	cd ..
}


terraform_destroy
