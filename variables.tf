variable "prefix" {
  type        = string
  description = "Resources name prefix"
  default     = "d01"
}

variable "location" {
  type        = string
  description = "Location of the resource group."
  default     = "northeurope"
}

variable "subscription_id" {
  type        = string
  description = "Azure subscription ID."
  default     = "1b08b9a2-ac6d-4b86-8a2f-8fef552c8371"
}
