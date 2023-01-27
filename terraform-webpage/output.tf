
output "ipv4_webpage" {

	description = "ipv4_webpage"
	value       = digitalocean_droplet.web.ipv4_address 
}
