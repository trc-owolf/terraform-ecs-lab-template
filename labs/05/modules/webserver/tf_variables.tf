variable "technical_contact" {
  description = "Your name or email - i.e. the technical contact for the resources"
  type        = string
}

variable "region" {
  default     = "eu-central-1"
  type        = string
  description = "Main region for most resources"
}

variable "subnet" {
  default     = null
  description = "Subnet ID for the web server"
}

variable "vpc_id" {
  default     = null
  description = "VPC ID for the security group"
}
