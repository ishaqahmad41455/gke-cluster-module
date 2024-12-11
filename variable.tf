# For VPC network
variable "vpc_name" {
  description = "Name of the VPC network"
  type        = string
  default     = "vpc"
}

variable "routing_mode" {
  description = "Routing mode of the VPC network"
  type        = string
  default     = "REGIONAL"
}

variable "auto_create_subnetworks" {
  description = "Auto create subnetworks in the VPC"
  type        = bool
  default     = false
}

variable "mtu" {
  description = "MTU of the VPC network"
  type        = number
  default     = 1460
}

variable "delete_default_routes_on_create" {
  description = "Delete default routes on VPC creation"
  type        = bool
  default     = false
}

# for subnets
variable "subnet_name" {
  description = "Name of the subnetwork"
  type        = string
  default     = "subnet"
}

variable "ip_cidr_range" {
  description = "CIDR range for the subnetwork"
  type        = string
  default     = "10.0.0.0/16"
}

variable "region" {
  description = "Region for the subnetwork"
  type        = string
  default     = "us-central1"
}

variable "private_ip_google_access" {
  description = "Enable private IP Google access"
  type        = bool
  default     = true
}

variable "pod_range_name" {
  description = "Range name for the Kubernetes pod range"
  type        = string
  default     = "k8s-pod-range"
}

variable "pod_ip_cidr_range" {
  description = "CIDR range for the Kubernetes pod range"
  type        = string
  default     = "10.1.0.0/16"
}

variable "service_range_name" {
  description = "Range name for the Kubernetes service range"
  type        = string
  default     = "k8s-service-range"
}

variable "service_ip_cidr_range" {
  description = "CIDR range for the Kubernetes service range"
  type        = string
  default     = "10.2.0.0/20"
}


variable "project_id" {
  description = "Project in which GCP Resources to be created"
  type = string
  default = "aesthetic-site-443805-a0"
}


variable "general_node_pool_name" {
  description = "General node pool name"
  type        = string
}

variable "spot_node_pool_name" {
  description = "Spot node pool name"
  type        = string
}

variable "cluster_name" {
  description = "Cluster name for the node pools"
  type        = string
}

variable "general_node_count" {
  description = "Number of nodes in the general node pool"
  type        = number
  default     = 1
}

variable "general_machine_type" {
  description = "Machine type for general node pool"
  type        = string
  default     = "ec2-small"
}

variable "spot_min_node_count" {
  description = "Minimum number of nodes for spot node pool"
  type        = number
  default     = 0
}

variable "spot_max_node_count" {
  description = "Maximum number of nodes for spot node pool"
  type        = number
  default     = 5
}

variable "spot_machine_type" {
  description = "Machine type for spot node pool"
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

variable "firewall_name" {
  description = "Name of the firewall rule"
  type        = string
}


variable "allowed_protocol" {
  description = "Protocol allowed by the firewall rule"
  type        = string
  default     = "tcp"
}

variable "allowed_ports" {
  description = "Ports allowed by the firewall rule"
  type        = list(string)
  default     = ["22"]
}

variable "source_ranges" {
  description = "Source ranges allowed to connect"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}


variable "router_name" {
  description = "The name of the router"
  type        = string
  default     = "router"  # Optional default value, adjust as needed
}

variable "nat_name" {
  description = "The name of the NAT resource"
  type        = string
  default     = "nat"
}


variable "source_subnetwork_ip_ranges_to_nat" {
  description = "The subnetwork IP ranges to NAT"
  type        = string
  # default     = ["ALL_IP_RANGES"]
}

variable "source_ip_ranges_to_nat" {
  description = "The IP ranges to NAT in the subnetwork"
  type        = list(string)
  default     = ["ALL_IP_RANGES"]
}

# Subnet
variable "container_service_enabled" {
  description = "Enable container service"
  type        = bool
  default     = true
}

variable "subnet_ip_range" {
  description = "The IP range for the subnet"
  type        = string
}


variable "network_self_link" {
  description = "The self-link of the network"
  type        = string
}
