resource "digitalocean_droplet" "www-1" {
    image = "centos-7-x64"
    name = "www-1"
    region = "tor1"
    size = "s-1vcpu-1gb"
    private_networking = true
    ssh_keys = [
      var.ssh_fingerprint
    ]
  connection {

    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }
  provisioner "local-exec" {
    command = "sleep 60; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u root --private /home/chronos/.ssh/id_ed25519 -i '${digitalocean_droplet.www-1.ipv4_address},' main.yml"
  }
}
