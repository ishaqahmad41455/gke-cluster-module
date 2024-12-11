variable "firewall_name" {
  description = "Name of the firewall rule"
  type        = string
}

variable "network" {
  description = "VPC network to attach the firewall rule"
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
