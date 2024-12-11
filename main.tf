
# Calling VPC module
module "vpc" {
  source                     = "./modules/vpc"
  vpc_name                   = var.vpc_name
  routing_mode               = var.routing_mode
  auto_create_subnetworks     = var.auto_create_subnetworks
  mtu                         = var.mtu
  delete_default_routes_on_create = var.delete_default_routes_on_create
}

# Calling Subnets module
module "subnet" {
  source                 = "./modules/subnet"
  subnet_name            = var.subnet_name
  subnet_ip_range          = var.subnet_ip_range
  region                 = var.region
  network_self_link      = google_compute_network.vpc.self_link
  private_ip_google_access = var.private_ip_google_access
  pod_range_name         = var.pod_range_name
  pod_ip_cidr_range      = var.pod_ip_cidr_range
  service_range_name     = var.service_range_name
  service_ip_cidr_range  = var.service_ip_cidr_range
  # subnet_ip_range        = var.subnet_ip_range  # Add the missing variable here
}


module "nat" {
  source = "./modules/nat"

  nat_name                       = var.nat_name
  region                         = var.region
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat
  source_ip_ranges_to_nat        = var.source_ip_ranges_to_nat
}

output "nat_address" {
  description = "The NAT address created"
  value       = module.nat.nat_address
}

output "nat_router_name" {
  description = "The router name associated with the NAT"
  value       = module.nat.nat_router_name
}

output "nat_ip" {
  description = "The NAT IP addresses assigned"
  value       = module.nat.nat_ip
}


module "router" {
  source  = "./modules/router"
  router_name = var.router_name
  region      = var.region
  network     = module.vpc.network_id  # Assuming network is an output from the VPC module
}

# module "service_account" {
#   source       = "./modules/service_account"
#   account_id   = var.account_id
#   display_name = var.display_name
# }

# Module for General Node Pool
module "general_node_pool" {
  source        = "./modules/node"
  pool_name     = var.general_node_pool_name
  cluster_name  = var.cluster_name
  node_count    = var.general_node_count
  preemptible   = false
  machine_type  = var.general_machine_type
  role_label    = "general"
  team_label    = "devops"
  service_account = module.service_account.email
}

# Module for Spot Node Pool
module "spot_node_pool" {
  source        = "./modules/node"
  pool_name     = var.spot_node_pool_name
  cluster_name  = var.cluster_name
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

module "gke_cluster" {
  source              = "./modules/gke"
  cluster_name        = var.cluster_name
  location            = var.location
  node_locations      = var.node_locations
  network             = var.network
  subnetwork          = var.subnetwork
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

module "firewall_rule" {
  source           = "./modules/firewall"
  firewall_name    = var.firewall_name
  network          = var.network
  allowed_protocol = var.allowed_protocol
  allowed_ports    = var.allowed_ports
  source_ranges    = var.source_ranges
}

