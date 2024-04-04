provider "aws" {
  default_tags {
    tags = {
      environment = "dev"
      terraform   = "true"
    }
  }
}

module "sns_topic" {
  source  = "so1omon563/sns/aws"
  version = "2.0.0" # Replace with appropriate version

  name         = "example-topic"
  topic_prefix = "my-product-name"
  tags = {
    example = "true"
  }
}
output "sns_topic" { value = module.sns_topic }
