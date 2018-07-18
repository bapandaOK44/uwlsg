resource "digitalocean_droplet" "ca" {
  count              = 1
  image              = "ubuntu-18-04-x64"
  size               = "s-1vcpu-1gb"
  region             = "sfo1"
  name               = "ca"
  ssh_keys           = ["${digitalocean_ssh_key.ssh.id}"]
  private_networking = true
  tags               = ["ca"]
}

resource "digitalocean_domain" "ca_fqdn" {
  name       = "ca.${var.domain}"
  ip_address = "${digitalocean_droplet.ca.ipv4_address}"
}
