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
 