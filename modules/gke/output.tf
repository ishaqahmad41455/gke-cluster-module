output "cluster_endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "master_version" {
  value = google_container_cluster.primary.master_version
}

output "cluster_name" {
  value = google_container_cluster.primary.name
}

