output "node_pool_name" {
  description = "Name of the node pool"
  value       = google_container_node_pool.node_pool.name
}

output "node_pool_instance_count" {
  description = "Number of instances in the node pool"
  value       = google_container_node_pool.node_pool.node_count
}
