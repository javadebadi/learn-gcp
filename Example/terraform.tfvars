project_id = "qwiklabs-gcp-03-4b119ab0e91f"
project_name = "qwiklabs-gcp-03-4b119ab0e91f"
project_number = 370853509872
region = "us-east1"
zone = "us-east1-b"
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
  region = "us-east1"
  num_nodes = 3
  zone = "us-east1-b"
}

app_name = "my-app"
app_git_repo_name = "my-app-source"
env_git_repo_name = "my-app-source-for-env"