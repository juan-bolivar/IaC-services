# Create a new Web Droplet in the nyc2 region
resource "digitalocean_droplet" "web" {
  image  = "ubuntu-22-04-x64"
  name   = "web"
  region = var.do_region
  size   = "s-1vcpu-1gb"
  ssh_keys = [digitalocean_ssh_key.default.fingerprint]
}

resource "digitalocean_ssh_key" "default" {
  name       = "Terraform"
  public_key = file(var.pvt_key)
}

resource "digitalocean_domain" "default" {
  name = var.server
}

resource "digitalocean_record" "www" {
  domain = digitalocean_domain.default.id
  type   = "A"
  name   = "www"
  value  = digitalocean_droplet.web.ipv4_address
}

resource "digitalocean_record" "main" {
  domain = digitalocean_domain.default.id
  type   = "A"
  name   = "@"
  value  = digitalocean_droplet.web.ipv4_address
}

