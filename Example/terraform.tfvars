project_id = "qwiklabs-gcp-03-1a8f660068f6"
project_name = "qwiklabs-gcp-04-53accf601b78"
project_number = 1014637488753
region = "us-east4"
zone = "us-east4-b"
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
  region = "us-east4"
  num_nodes = 3
  zone = "us-east4-b"
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
