output "app_static_ip_address" {
    description = "Static IPV4 address to use for load balancer"
    value = module.app_static_ip.ip_address
}

output "app_static_ip_self_link" {
    description = "Static IP self_link to use for load balancer"
    value = module.app_static_ip.self_link
}