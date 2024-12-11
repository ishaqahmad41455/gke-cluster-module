resource "google_compute_subnetwork" "subnet" {
  name                      = var.subnet_name
  ip_cidr_range             = var.subnet_ip_range
  region                    = var.region
  network                   = var.network_self_link
  private_ip_google_access  = var.private_ip_google_access

  secondary_ip_range {
    range_name    = var.pod_range_name
    ip_cidr_range = var.pod_ip_cidr_range
  }

  secondary_ip_range {
    range_name    = var.service_range_name
    ip_cidr_range = var.service_ip_cidr_range
  }
}
