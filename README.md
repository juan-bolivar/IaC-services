# Personal Webpage using Lugo in Digital Ocean

## Webpage

Creates a [Lugo](https://github.com/LukeSmithxyz/lugo) webpage using Apache and Terraform with the digital ocean provider.

### Requisites:
- digital-ocean-token: [Documentation ](https://docs.digitalocean.com/reference/api/create-personal-access-token/).
- FQDN registered with digital ocean nameservers: [ns registration](https://docs.digitalocean.com/tutorials/dns-registrars/).
- Local ssh Private / Public key: [SSH key creation](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key). 
- Ubuntu 22.04 (LTS) to run the script.
- Terraform 1.3.7

### Use

config.ini file with:

- do_token.
- pvt_key path.
- servername.

For creation:

`bash start.sh`

For deletion:

`bash destroy.sh`
