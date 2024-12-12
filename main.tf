module "vpc" {
  source                     = "./modules/vpc"
  vpc_name                   = var.vpc_name
  routing_mode               = var.routing_mode
  auto_create_subnetworks     = var.auto_create_subnetworks
  mtu                         = var.mtu
  delete_default_routes_on_create = var.delete_default_routes_on_create
}

module "subnet" {
  source                 = "./modules/subnet"
  subnet_name            = var.subnet_name
  subnet_ip_range       = var.subnet_ip_range
  region                = var.region
  network_self_link     = module.vpc.network_self_link
  private_ip_google_access = var.private_ip_google_access
  pod_range_name        = var.pod_range_name
  ip_cidr_range         = var.ip_cidr_range
  pod_ip_cidr_range     = var.pod_ip_cidr_range
  service_range_name    = var.service_range_name
  service_ip_cidr_range = var.service_ip_cidr_range
}

module "nat" {
  source                       = "./modules/nat"
  project_id                   = var.project_id
  nat_name                     = var.nat_name
  region                       = var.region
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat
  source_ip_ranges_to_nat      = var.source_ip_ranges_to_nat
  router_name                  = google_compute_router.router.name  # Pass router name
  subnet_id                    = google_compute_subnetwork.subnet.id # Pass subnet ID
}

module "router" {
  source          = "./modules/router"
  router_name     = var.router_name
  region          = var.region
  network         = module.vpc.network_self_link
}

module "service_account" {
  source           = "./modules/service_account"
  account_id       = var.account_id
  display_name     = var.display_name
}

module "gke_cluster" {
  source              = "./modules/gke"
  cluster_name        = var.cluster_name
  location            = var.location
  node_locations      = var.node_locations
  network             = module.vpc.network_self_link
  subnetwork          = module.subnet.subnet_name
  logging_service     = var.logging_service
  networking_mode     = var.networking_mode
  workload_pool       = var.workload_pool
  cluster_secondary_range_name = var.cluster_secondary_range_name
  services_secondary_range_name = var.services_secondary_range_name
  enable_private_nodes = var.enable_private_nodes
  enable_private_endpoint = var.enable_private_endpoint
  master_ipv4_cidr_block = var.master_ipv4_cidr_block
  release_channel     = var.release_channel
  deletion_protection = var.deletion_protection
}

module "general_node_pool" {
  source        = "./modules/node"
  pool_name     = var.general_node_pool_name
  cluster_name  = module.gke_cluster.cluster_name
  node_count    = var.general_node_count
  preemptible   = false
  machine_type  = var.general_machine_type
  role_label    = "general"
  team_label    = "devops"
  service_account = module.service_account.email
}

module "spot_node_pool" {
  source        = "./modules/node"
  pool_name     = var.spot_node_pool_name
  cluster_name  = module.gke_cluster.cluster_name
  preemptible   = true
  min_node_count = var.spot_min_node_count
  max_node_count = var.spot_max_node_count
  machine_type  = var.spot_machine_type
  role_label    = "devops"
  team_label    = "devops"
  taint_key     = "instance_type"
  taint_value   = "spot"
  taint_effect  = "NO_SCHEDULE"
  service_account = module.service_account.email
}

module "firewall_rule" {
  source           = "./modules/firewall"
  firewall_name    = var.firewall_name
  network          = module.vpc.network_self_link
  allowed_protocol = var.allowed_protocol
  allowed_ports    = var.allowed_ports
  source_ranges    = var.source_ranges
}
