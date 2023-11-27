resource "google_cloudbuild_trigger" "push_to_app_repo" {
  name     = "hell-cloudbuild"
  project  = var.project_id

  depends_on = [ module.docker_registry, module.git_google_source ]

  trigger_template {    
    project_id = var.project_id
    repo_name = var.app_git_repo_name
    branch_name   = ".*"
  }

  substitutions = {
    _REGION = var.region
    _ZONE = var.zone
    _REPOSITORY_NAME =  "${var.app_name}-ar"
    _GOOGLE_MAP_API_KEY_SECRET_NAME = var.google_map_api_key_secret_id
  }

   build {

    # step to build image
    step {
      name = "gcr.io/cloud-builders/docker"
      id = "build"
      args = ["build", "-t", "$${_REGION}-docker.pkg.dev/$PROJECT_ID/$_REPOSITORY_NAME/hello-cloudbuild:$SHORT_SHA", "./backend"]
      secret_env =  ["GOOGLE_MAP_API_KEY"]  # Ensure GOOGLE_MAP_API_KEY is referenced
    }

    available_secrets {
      secret_manager {
         env = "GOOGLE_MAP_API_KEY"
         version_name = "projects/$PROJECT_ID/secrets/$_GOOGLE_MAP_API_KEY_SECRET_NAME/versions/latest"
      }
    }


    # This step pushes the image to Artifact Registry
    # The PROJECT_ID and SHORT_SHA variables are automatically
    # replaced by Cloud Build.
    step {
        name = "gcr.io/cloud-builders/docker"
        id = "Push"
        args = ["push", "$${_REGION}-docker.pkg.dev/$PROJECT_ID/$_REPOSITORY_NAME/hello-cloudbuild:$SHORT_SHA"]
    }


   }

  
  
#   included_files = ["**/*"]  # Build on any file change

#    filename = "cloudbuild.yaml"  # This file should be present in your repo
}


resource "google_project_iam_binding" "secret_accessor_binding" {
  project = var.project_id # Replace with your project ID
  role    = "roles/secretmanager.secretAccessor"

  members = [
    "serviceAccount:${var.project_number}@cloudbuild.gserviceaccount.com",
  ]
}