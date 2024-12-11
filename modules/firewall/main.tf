resource "google_compute_firewall" "allow-ssh" {
  name    = var.firewall_name
  network = var.network

  allow {
    protocol = var.allowed_protocol
    ports    = var.allowed_ports
  }

  source_ranges = var.source_ranges
}
