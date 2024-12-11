output "router_id" {
  description = "ID of the router"
  value       = google_compute_router.router.id
}

output "router_self_link" {
  description = "Self-link of the router"
  value       = google_compute_router.router.self_link
}
