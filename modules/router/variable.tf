variable "router_name" {
  description = "Name of the router"
  type        = string
}

variable "region" {
  description = "Region for the router"
  type        = string
}

variable "network" {
  description = "Network ID to which the router will be attached"
  type        = string
}
