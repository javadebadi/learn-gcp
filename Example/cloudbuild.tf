resource "google_cloudbuild_trigger" "push_to_app_repo" {
  name     = "hell-cloudbuild"
  project  = var.project_id

  depends_on = [ module.docker_registry, module.module.git_google_source ]

  trigger_template {    
    project_id = var.project_id
    repo_name = var.app_git_repo_name
    branch_name   = ".*"
  }

  substitutions = {
    _REGION = var.region
    _ZONE = var.zone
    _REPOSITORY_NAME =  "${var.app_name}-ar"
  }

   build {

    # step to build image
    step {
      name = "gcr.io/cloud-builders/docker"
      id = "build"
      args = ["build", "-t", "", "${_REGION}-docker.pkg.dev/$PROJECT_ID/$_REPOSITORY_NAME/hello-cloudbuild:$SHORT_SHA", "."]
    }


    # This step pushes the image to Artifact Registry
    # The PROJECT_ID and SHORT_SHA variables are automatically
    # replaced by Cloud Build.
    step {
        name = "gcr.io/cloud-builders/docker"
        id = "Push"
        args = ["push", "${_REGION}-docker.pkg.dev/$PROJECT_ID/$__REPOSITORY_NAME/hello-cloudbuild:$SHORT_SHA"]
    }


   }

  
  
#   included_files = ["**/*"]  # Build on any file change

#    filename = "cloudbuild.yaml"  # This file should be present in your repo
}
