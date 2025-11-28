data "aws_availability_zones" "east-azs" {
  provider = aws.us-east-1
  state    = "available"
}

data "aws_availability_zones" "west-azs" {
  provider = aws.us-west-1
  state    = "available"
}

data "aws_availability_zones" "eu-azs" {
  provider = aws.eu-central-1
  state    = "available"
}
