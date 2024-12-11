variable "nat_name" {
  description = "The name of the NAT resource"
  type        = string
  default     = "nat"
}

variable "region" {
  description = "The region to deploy resources in"
  type        = string
  default     = "us-central1"
}

# variable "source_subnetwork_ip_ranges_to_nat" {
#   description = "The subnetwork IP ranges to NAT"
#   type        = list(string)
#   default     = ["ALL_IP_RANGES"]
# }

variable "source_ip_ranges_to_nat" {
  description = "The IP ranges to NAT in the subnetwork"
  type        = list(string)
  default     = ["ALL_IP_RANGES"]
}

variable "source_subnetwork_ip_ranges_to_nat" {
    description = "The subnetwork ip range "
    type = string
}