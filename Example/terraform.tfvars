project_id = "qwiklabs-gcp-01-6e165d929f27"
project_name = "qwiklabs-gcp-01-6e165d929f27"
project_number = 968057852158
region = "us-west1"
zone = "us-west1-b"
api_services = [
  "cloudresourcemanager.googleapis.com",
  "container.googleapis.com",
  "cloudbuild.googleapis.com",
  "artifactregistry.googleapis.com",
  "containerregistry.googleapis.com",
  "containerscanning.googleapis.com",
  "containeranalysis.googleapis.com",
  "sourcerepo.googleapis.com",
  "secretmanager.googleapis.com"
]
k8_cluster = {
  name = "hello-cloudbuild"
  region = "us-west1"
  num_nodes = 3
  zone = "us-west1-b"
}

app_name = "my-app"
app_git_repo_name = "my-app-source"
env_git_repo_name = "my-app-source-for-env"

cloudbuild_service_account_roles = [
    "roles/secretmanager.secretAccessor",
    "roles/container.developer",
    "roles/source.writer"
]

git_config = {
  username = "javadebadi"
  email = "javad.ebadi.1990@gmail.com"
}
