project_id = "qwiklabs-gcp-00-8cb0c774c14c"
project_name = "qwiklabs-gcp-00-8cb0c774c14c"
project_number = 497283868777
region = "us-central1"
zone = "us-central1-a"

api_services = [
  #"cloudresourcemanager.googleapis.com",
  "container.googleapis.com",
  "cloudbuild.googleapis.com",
  "artifactregistry.googleapis.com",
  "containerregistry.googleapis.com",
  #"containerscanning.googleapis.com",
  "containeranalysis.googleapis.com",
  "sourcerepo.googleapis.com"
] 

artifacts_registry_repository_name = "my-repository"

k8_cluster = {
  name = "hello-cloudbuild"
  region = "us-central1"
  num_nodes = 1
  zone = "us-centra1-a"
}

git_config = {
  username = "javadebadi"
  email = "javad.ebadi.1990@gmail.com"
}