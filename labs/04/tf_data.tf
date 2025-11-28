data "aws_caller_identity" "current" {
}

data "aws_partition" "current" {
}

data "aws_iam_policy_document" "key-policy" {

  statement {
    sid    = "Enable IAM Root User Permissions"
    effect = "Allow"
    actions = [
      "kms:*"
    ]
    resources = ["*"]
    principals {
      type = "AWS"
      identifiers = [
        format("arn:aws:iam::%s:root", local.account_id)
      ]
    }
  }

  statement {
    sid    = "Allow AWS to describe encryption"
    effect = "Allow"
    actions = [
      "kms:DescribeKey"
    ]
    resources = ["*"]
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }

  statement {
    sid    = "Allow AWS principals to decrypt"
    effect = "Allow"
    actions = [
      "kms:Decrypt",
      "kms:ReEncryptFrom"
    ]
    resources = ["*"]
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}
