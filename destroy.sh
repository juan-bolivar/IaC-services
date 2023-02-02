#!/bin/bash

source config.ini

function terraform_destroy(){

	pushd terraform
	terraform destroy -var "do_region=$do_region" -var "server=$server" -var "do_token=$do_token" -var "pvt_key=$pvt_key" 
	popd
}


terraform_destroy
