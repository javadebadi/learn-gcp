provider "null" {}

#pull the code from github
resource "null_resource" "git_clone" {
  provisioner "local-exec" {
    command = "cd ~ && git clone ${var.repository_url} ${var.destination_path} && cd -"
  }
}

resource "null_resource" "add_google_source_origin" {
  depends_on = [ module.app_google_source_repo, null_resource.git_clone ]
  provisioner "local-exec" {
    command = "cd ~/${var.destination_path} && git remote add google ${module.app_google_source_repo.repo_url}"
  }
  
}