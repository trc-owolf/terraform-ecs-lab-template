locals {
  account_id  = data.aws_caller_identity.current.account_id
  partition   = data.aws_partition.current.partition
  bucket-name = format("%s-%s-%s-%s", var.name_prefix, lower(random_id.rid.id), local.account_id, var.region)
  key-name    = format("%s-%s-cmk", var.name_prefix, lower(random_id.rid.id))
}
