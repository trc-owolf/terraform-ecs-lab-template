provider "aws" {
  region = var.region

  # Required for execution in the Lab environment
  # Add value from the environment variable and remove comments
  /*
  assume_role {
    role_arn    = "<LAB_AWS_ROLE_ARN>"
  }
  */
}
