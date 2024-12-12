resource "google_project_service" "compute" {
  project = var.project_id  # Make sure to pass the project ID

  service = "compute.googleapis.com"
}


resource "google_compute_address" "nat" {
  name          = var.nat_name
  region        = var.region
  address_type  = "EXTERNAL"
  network_tier  = "PREMIUM"

  depends_on = [google_project_service.compute]
}

resource "google_compute_router_nat" "nat" {
  name                          = var.nat_name
  router                        = google_compute_router.router.name
  region                        = var.region
  nat_ips                       = [google_compute_address.nat.self_link]
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat
  nat_ip_allocate_option        = "MANUAL_ONLY"

  subnetwork {
    name                       = google_compute_subnetwork.subnet.id
    source_ip_ranges_to_nat    = var.source_ip_ranges_to_nat
  }
}
