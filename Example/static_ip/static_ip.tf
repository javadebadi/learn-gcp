resource "random_string" "rnd" {
  length      = 4
  min_numeric = 4
  special     = false
  lower       = true
}


resource "google_compute_address" "ip_address" {
  name = "static-ip-${random_string.rnd.result}"
}