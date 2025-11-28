locals {
  count-of-azs-map = {
    "eu-central-1" = length(data.aws_availability_zones.eu-azs.names)
    "us-east-1"    = length(data.aws_availability_zones.east-azs.names)
    "us-west-1"    = length(data.aws_availability_zones.west-azs.names)
  }
  actual-azs = lookup(local.count-of-azs-map, var.region, 2)

  ## actual value of newbit n is minimal possible for 2^n less than or equal to the count of desired subnets
  cidrs = [for cidr-range in var.cidr_ranges : {
    "2"  = cidrsubnets(cidr-range, 1, 1)
    "3"  = cidrsubnets(cidr-range, 2, 2, 2)
    "4"  = cidrsubnets(cidr-range, 2, 2, 2, 2)
    "5"  = cidrsubnets(cidr-range, 3, 3, 3, 3, 3)
    "6"  = cidrsubnets(cidr-range, 3, 3, 3, 3, 3, 3)
    "7"  = cidrsubnets(cidr-range, 3, 3, 3, 3, 3, 3, 3)
    "8"  = cidrsubnets(cidr-range, 3, 3, 3, 3, 3, 3, 3, 3)
    "9"  = cidrsubnets(cidr-range, 4, 4, 4, 4, 4, 4, 4, 4, 4)
    "10" = cidrsubnets(cidr-range, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4)
    "11" = cidrsubnets(cidr-range, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4)
    "12" = cidrsubnets(cidr-range, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4)
    "13" = cidrsubnets(cidr-range, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4)
    "14" = cidrsubnets(cidr-range, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4)
    "15" = cidrsubnets(cidr-range, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4)
    "16" = cidrsubnets(cidr-range, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4)
    "17" = cidrsubnets(cidr-range, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5)
    ##_todo: Add more subnet numbers here if you like
    }
  ]

  subnets = var.subnet_count > 1 ? [for cidr in local.cidrs : lookup(cidr, var.subnet_count)] : [for cidr in local.cidrs : lookup(cidr, local.actual-azs)]
}
