module "enabled_google_apis_and_services" {
    source = "./google_apis"
    project_id = var.project_id
    api_services = var.api_services
}

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

module "git_google_source_for_env" {
    source = "./git_google_source"
    repo_name = var.env_git_repo_name
}

module "k8_cluster" {
    source = "./k8"
    k8_cluster = var.k8_cluster

    depends_on = [ module.enabled_google_apis_and_services ]
}

module "app_github_pat" {
    source = "./github_token"
    secret_id = var.app_git_repo_name
}