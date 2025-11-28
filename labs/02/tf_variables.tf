variable "technical_contact" {
  description = "Your name or email - i.e. the technical contact for the resources"
  type        = string
}

variable "region" {
  default     = "eu-central-1"
  type        = string
  description = "Main region for most resources"
}
