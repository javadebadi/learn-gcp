module "app_static_ip" {
    source = "./static_ip"
}

module "docker_registry" {
    source = "./artifacts"
    artifacts_registry_repository_name = "${var.app_name}-ar"
    region = var.region
    project_id = var.project_id
}

module "git_google_source" {
    source = "./git_google_source"
    repo_name = var.app_git_repo_name
}