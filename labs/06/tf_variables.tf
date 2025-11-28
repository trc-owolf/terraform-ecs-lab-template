variable "region" {
  description = "Default region to deploy to"
  type        = string
  default     = "eu-central-1"
}

variable "name_prefix" {
  description = "Name prefix for all resources to make them unique - use an acronym of your name for example"
  type        = string
}

variable "technical_contact" {
  description = "Your name or email - i.e. the technical contact for the resources"
  type        = string
}
