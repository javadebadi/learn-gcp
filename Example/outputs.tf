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