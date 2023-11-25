resource "null_resource" "submit_to_cloud_build" {

  provisioner "local-exec" {
    command = "cd ~/${var.destination_path} && gcloud builds submit --tag=\"${var.region}-docker.pkg.dev/${var.project_id}/my-repository/hello-cloudbuild:${var.container_tag_name}\" && cd -"
  }
}



resource "google_cloudbuild_trigger" "this" {
  name     = "hell-cloudbuild"
  project  = var.project_id

  trigger_template {    
    project_id = var.project_id
    repo_name = var.app_google_source_repo_name
    branch_name   = ".*"
  }
  
  
#   included_files = ["**/*"]  # Build on any file change

   filename = "cloudbuild.yaml"  # This file should be present in your repo
}


resource "null_resource" "push_to_source_cloud" {

  depends_on = [ google_cloudbuild_trigger.this ]
  provisioner "local-exec" {
    command = "cd ~/${var.destination_path} && git push google master && cd -"
  }
}