resource "google_project_service" "compute" {
    service = "compute.googleapis.com"
    disable_dependent_services = true
}

resource "google_project_service" "container" {
    service = "container.googleapis.com"
}

resource "google_compute_network" "vpc" {
  name                      = var.vpc_name
  routing_mode              = var.routing_mode
  # description             = "VPC network"
  auto_create_subnetworks   = var.auto_create_subnetworks
  mtu                       = var.mtu
  delete_default_routes_on_create = var.delete_default_routes_on_create

  depends_on = [
    google_project_service.compute,
    google_project_service.container
  ]
}
