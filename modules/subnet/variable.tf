variable "subnet_name" {
  description = "The name of the subnet."
  type        = string
}

variable "subnet_ip_range" {
  description = "The CIDR range for the subnet."
  type        = string
}

variable "region" {
  description = "The region where the subnet is created."
  type        = string
  default     = "us-central1"  # Optionally set a default value
}

variable "private_ip_google_access" {
  description = "Whether to enable Google access to VMs without a public IP."
  type        = bool
  default     = true
}

variable "pod_range_name" {
  description = "The name of the secondary IP range for Kubernetes pods."
  type        = string
  default     = "k8s-pod-range"
}

variable "pod_ip_cidr_range" {
  description = "The CIDR range for Kubernetes pods."
  type        = string
  default     = "10.1.0.0/16"
}

variable "service_range_name" {
  description = "The name of the secondary IP range for Kubernetes services."
  type        = string
  default     = "k8s-service-range"
}

variable "service_ip_cidr_range" {
  description = "The CIDR range for Kubernetes services."
  type        = string
  default     = "10.2.0.0/20"
}

variable "ip_cidr_range" {
  description = "The CIDR range for the subnet"
  type        = string
}

variable "network_self_link" {
  description = "The self-link of the network"
  type        = string
}

