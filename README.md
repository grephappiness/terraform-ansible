# Overview
Here I'm using Terraform to interact via DigitalOcean API to deploy infrastructure to my DO account. I use local-exec to then run Ansible installed locally on my chromebook to SSH in and config said systems after the fact.

## Deployment Infrastructure
This terraform configuration builds 2 web servers with a load balancer and VIP setup in front. All to serve a static web page using nginx.

## Deployment How-To
__NOTE:__ DO Token and SSH fingerprint need to be exported prior to running `terraform`

```
terraform apply -var "do_token=${DO_PAT}" -var "pub_key=$HOME/.ssh/id_ed25519.pub" -var "pvt_key=$HOME/.ssh/id_ed25519" -
var "ssh_fingerprint=${DO_SSH_FINGERPRINT}"
```
