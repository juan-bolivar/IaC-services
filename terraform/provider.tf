terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.25.2"
    }
  }

required_version = "1.3.7"
}

provider "digitalocean" {
  token = var.do_token
}

