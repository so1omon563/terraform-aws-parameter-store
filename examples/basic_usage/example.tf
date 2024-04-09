provider "aws" {
  default_tags {
    tags = {
      environment = "dev"
      terraform   = "true"
    }
  }
}

module "parameter" {
  #   source  = "so1omon563/parameter-store/aws"
  # version = "1.0.0" # Replace with appropriate version

  source = "../.."

  name  = "tf-basic-usage-parameter"
  tags = {
    example = "true"
  }
  value = "example-parameter"
}
