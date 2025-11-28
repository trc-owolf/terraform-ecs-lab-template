output "subnet-cidrs" {
  description = "List of disjunct IP ranges/subnets, that provide a maximum of equal sized IP ranges for the given prefix"
  value       = local.subnets
}

output "actual-azs" {
  description = "Number of AZs in the current region"
  value       = local.actual-azs
}

output "current-region" {
  description = "Current region in use"
  value       = var.region
}
