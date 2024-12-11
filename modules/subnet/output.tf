output "subnet_name" {
  description = "The name of the created subnetwork."
  value       = google_compute_subnetwork.subnet.name
}

output "subnet_ip_range" {
  description = "The primary CIDR range of the subnet."
  value       = google_compute_subnetwork.subnet.ip_cidr_range
}

output "region" {
  description = "The region where the subnetwork is created."
  value       = google_compute_subnetwork.subnet.region
}

output "network_link" {
  description = "The self-link of the network this subnet belongs to."
  value       = google_compute_subnetwork.subnet.network
}
