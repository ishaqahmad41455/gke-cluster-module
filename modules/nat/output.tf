output "nat_address" {
  description = "The NAT address created"
  value       = google_compute_address.nat.address
}

output "nat_router_name" {
  description = "The router name associated with the NAT"
  value       = google_compute_router_nat.nat.router
}

output "nat_ip" {
  description = "The NAT IP addresses assigned"
  value       = google_compute_address.nat.self_link
}
