provider "null" {}

#pull the code from github
resource "null_resource" "git_clone" {
  provisioner "local-exec" {
    command = "git clone ${var.repository_url}"
  }
}