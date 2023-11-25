resource "null_resource" "git_config_email" {
  provisioner "local-exec" {
    command = "git config --global user.email ${var.git_user_email}"
  }
}

resource "null_resource" "git_config_username" {
  provisioner "local-exec" {
    command = "git config --global user.name ${var.git_user_username}"
  }
}