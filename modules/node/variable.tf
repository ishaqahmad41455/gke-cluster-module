variable "pool_name" {
  description = "Name of the node pool"
  type        = string
}

variable "cluster_name" {
  description = "Name of the cluster"
  type        = string
}

variable "node_count" {
  description = "Number of nodes"
  type        = number
  default     = 1
}

variable "min_node_count" {
  description = "Minimum node count for autoscaling"
  type        = number
  default     = 0
}

variable "max_node_count" {
  description = "Maximum node count for autoscaling"
  type        = number
  default     = 5
}

variable "preemptible" {
  description = "Use preemptible nodes"
  type        = bool
}

variable "machine_type" {
  description = "Machine type for nodes"
  type        = string
}

variable "role_label" {
  description = "Role label for the node pool"
  type        = string
}

variable "team_label" {
  description = "Team label for the node pool"
  type        = string
}

variable "service_account" {
  description = "Service account email to attach to the node pool"
  type        = string
}

variable "taint_key" {
  description = "Taint key for node taints"
  type        = string
  default     = ""
}

variable "taint_value" {
  description = "Taint value for node taints"
  type        = string
  default     = ""
}

variable "taint_effect" {
  description = "Taint effect for node taints"
  type        = string
  default     = ""
}
