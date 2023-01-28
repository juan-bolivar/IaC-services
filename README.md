# Personal Webpage using Lugo in Digital Ocean

## Webpage

Creates a [Lugo](https://github.com/LukeSmithxyz/lugo) webpage using Apache and Terraform with the digital ocean provider.

### Requisites:
- digital-ocean-token: [Documentation ](https://docs.digitalocean.com/reference/api/create-personal-access-token/)
- FQDN registered with digital ocean nameservers: [ns registration](https://docs.digitalocean.com/tutorials/dns-registrars/)

### Use

config.ini file with:

- do_token.
- pvt_key path.
- servername.

For creation:

`bash start.sh`

For deletion:

`bash destroy.sh`
