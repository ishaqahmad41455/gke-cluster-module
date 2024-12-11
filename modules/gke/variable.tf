variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
}

variable "location" {
  description = "Location of the cluster (zone or region)"
  type        = string
}

variable "node_locations" {
  description = "Node locations for multi-zonal clusters"
  type        = list(string)
  default     = []
}

variable "network" {
  description = "VPC network for the GKE cluster"
  type        = string
}

variable "subnetwork" {
  description = "Subnetwork for the GKE cluster"
  type        = string
}

variable "logging_service" {
  description = "Logging service for the GKE cluster"
  type        = string
  default     = "logging.googleapis.com/kubernetes"
}

variable "networking_mode" {
  description = "Networking mode for the cluster (VPC_NATIVE)"
  type        = string
}

variable "workload_pool" {
  description = "Workload Identity Pool for GKE"
  type        = string
}

variable "cluster_secondary_range_name" {
  description = "Secondary range for the cluster"
  type        = string
}

variable "services_secondary_range_name" {
  description = "Secondary range for the services"
  type        = string
}

variable "enable_private_nodes" {
  description = "Enable private nodes"
  type        = bool
  default     = true
}

variable "enable_private_endpoint" {
  description = "Enable private endpoint"
  type        = bool
  default     = false
}

variable "master_ipv4_cidr_block" {
  description = "Master IPv4 CIDR block"
  type        = string
  default     = "172.16.0.0/28"
}

variable "release_channel" {
  description = "Release channel for GKE cluster"
  type        = string
  default     = "REGULAR"
}

variable "deletion_protection" {
  description = "Enable deletion protection"
  type        = bool
  default     = false
}
