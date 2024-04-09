provider "aws" {
  default_tags {
    tags = {
      environment = "dev"
      terraform   = "true"
    }
  }
}

variable "name" {
  default = "tf-basic-usage-parameter"
}
variable "tags" {
  default = {
    example = "true"
  }
}

module "parameter" {
  source = "../.."

  name  = var.name
  tags  = var.tags
  value = "example"
}
output "parameter" {
  value     = module.parameter
  sensitive = true
}
