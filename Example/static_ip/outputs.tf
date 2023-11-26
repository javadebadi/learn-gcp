
output "ip_address" {
    value = google_compute_address.ip_address.address
}

output "self_link" {
    value = google_compute_address.ip_address.self_link
}