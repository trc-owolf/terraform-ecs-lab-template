locals {
  account_id = data.aws_caller_identity.current.account_id
  partition  = data.aws_partition.current.partition

  # To avoid circular dependencies while providing least privilege policies, fix the naming here
  bucket-name = format("%s-%s-%s-%s", var.name_prefix, random_pet.pet.id, local.account_id, var.region)
  key-name    = format("%s-%s-cmk", var.name_prefix, random_pet.pet.id)
}
