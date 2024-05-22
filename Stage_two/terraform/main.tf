provider "null" {}

resource "null_resource" "vagrant" {
  provisioner "local-exec" {
    command = "vagrant up"
  }

  provisioner "local-exec" {
    command = "vagrant ssh -c 'cd /vagrant/ansible && ansible-galaxy install -r requirements.yml && ansible-playbook -i inventory playbook.yml'"
  }
}
