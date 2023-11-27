project_id = "qwiklabs-gcp-02-e9e7780b074b"
project_name = "qwiklabs-gcp-02-e9e7780b074b"
project_number = 673167022268
region = "us-east4"
zone = "us-east4-a"
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
  zone = "us-east4-a"
}

app_name = "my-app"
app_git_repo_name = "my-app-source"
env_git_repo_name = "my-app-source-for-env"