project_id = "qwiklabs-gcp-04-53accf601b78"
project_name = "qwiklabs-gcp-04-53accf601b78"
project_number = 219516083580
region = "us-central1"
zone = "us-central1-a"
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
  region = "us-central1"
  num_nodes = 3
  zone = "us-central1-a"
}

app_name = "my-app"
app_git_repo_name = "my-app-source"
env_git_repo_name = "my-app-source-for-env"