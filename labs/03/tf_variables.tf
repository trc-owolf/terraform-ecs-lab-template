variable "region" {
  description = "Region for which to evaluate subnets.x"
  type        = string
}

variable "cidr_ranges" {
  type        = list(string)
  default     = ["10.123.2.0/24", "172.29.0.0/19"]
  description = "Provide list of CIDR ranges (prefixes) to split uniformly to return a list of disjunct subnets in the same order."
}

/* Remark: There is a real-life constraint, that
IP ranges should be RFC1918 conform:
10.0.0.0/8 or less
172.16.0.0/12 or less
192.168.0.0/16 or less
*/

variable "subnet_count" {
  type        = string
  description = "Number of subnets for which ranges should be calculated. Specify -1 for all available availability zones within the given region. You can use this to calculate the number of AZs first and then multiply by the number of tiers required."
  default     = -1
}
