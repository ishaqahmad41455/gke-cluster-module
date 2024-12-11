variable "vpc_name" {
  description = "Name of the VPC network"
  type        = string
}

variable "routing_mode" {
  description = "Routing mode of the VPC network"
  type        = string
}

variable "auto_create_subnetworks" {
  description = "Auto create subnetworks in the VPC"
  type        = bool
}

variable "mtu" {
  description = "MTU of the VPC network"
  type        = number
}

variable "delete_default_routes_on_create" {
  description = "Delete default routes on VPC creation"
  type        = bool
}
