variable "region" {
  description = "Default region to deploy to"
  type        = string
  default     = "eu-central-1"
}

variable "name_prefix" {
  description = "Name prefix for all resources to make them unique - use an acronym of your name for example"
  type        = string
}
