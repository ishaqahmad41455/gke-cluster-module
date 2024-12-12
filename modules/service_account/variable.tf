variable "account_id" {
  description = "The account ID of the service account (must be unique within the project)."
  type        = string
}

variable "display_name" {
  description = "The display name for the service account."
  type        = string
  default     = "My Service Account"  # You can set a default value or remove this if you want it to be mandatory
}