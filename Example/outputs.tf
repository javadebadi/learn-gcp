output "app_static_ip_address" {
    description = "Static IPV4 address to use for load balancer"
    value = module.app_static_ip.ip_address
}

output "app_static_ip_self_link" {
    description = "Static IP self_link to use for load balancer"
    value = module.app_static_ip.self_link
}

output "docker_artifacts_registry_address" {
    description = "Address of the docker artifacts registry for the app"
    value = module.docker_registry.address
}

output "docker_artifacts_registry_id" {
    description = "id of the docker artifacts registry for the app"
    value = module.docker_registry.id
}
 
output "git_google_source_repo_name" {
    description = "Name of the git repo for the app in the google source git server"
    value = module.git_google_source.repo_name
}
 
output "git_google_source_repo_url" {
    description = "URL of the git repo for the app in the google source git server"
    value  = module.git_google_source.repo_url
}
 
output "git_google_source_for_env_repo_url" {
    description = "URL of the git repo for the env in the google source git server"
    value  = module.git_google_source_for_env.repo_url
}

output "enabled_google_apis_and_services" {
    description = "List of enabled Google APIs and Services"
    value = module.enabled_google_apis_and_services.enabled_google_cloud_apis_and_services
}

output "k8_cluster_self_link" {
    description = "Detials of the created K8 cluster"
    value = module.k8_cluster.k8_cluster_self_link
}

output "app_github_pat_secret_id" {
    description = "Id of the secret storage for the app github PAT"
    value = module.app_github_pat.secret_id
}

output "google_map_api_key_secret_name" {
    description = "Name of the secret for google map API"
    value = module.google_map_api_key_secret.secret_name
}