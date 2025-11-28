variable "region" {
  description = "Region to deploy resources to"
  type        = string
  default     = "eu-central-1"
}

variable "message" {
  description = "Message that should be send to the SNS topic"
  type        = string
  default     = "This is a default message."
}
