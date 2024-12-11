output "cluster_name" {
  description = "The name of the cluster"
  value       = google_container_cluster.primary.name
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
