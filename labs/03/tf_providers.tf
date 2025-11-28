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

provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"

  # Required for execution in the Lab environment
  # Add value from the environment variable and remove comments
  /*
  assume_role {
    role_arn    = "<LAB_AWS_ROLE_ARN>"
  }
  */
}

provider "aws" {
  alias  = "us-west-1"
  region = "us-west-1"

  # Required for execution in the Lab environment
  # Add value from the environment variable and remove comments
  /*
  assume_role {
    role_arn    = "<LAB_AWS_ROLE_ARN>"
  }
  */
}

provider "aws" {
  alias  = "eu-central-1"
  region = "eu-central-1"

  # Required for execution in the Lab environment
  # Add value from the environment variable and remove comments
  /*
  assume_role {
    role_arn    = "<LAB_AWS_ROLE_ARN>"
  }
  */
}
