output "cluster_name" {
  description = "The name of the cluster"
  value = module.gke_cluster.cluster_name
}

output "location" {
  description = "The location of the cluster"
  value       = google_container_cluster.primary.location
}

output "endpoint" {
  description = "The GKE cluster endpoint"
  value       = google_container_cluster.primary.endpoint
}

output "master_version" {
  description = "The master Kubernetes version"
  value       = google_container_cluster.primary.master_version
}

output "network_id" {
  value = module.vpc.network_id
}

output "email" {
  value = module.service_account.email
}
