# SNS Topic

Basic quickstart for creating a SNS Topic resource.

Example shows using Default Tags in the provider as well as passing additional tags into the resource.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


## Examples

```hcl
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
```

## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_parameter"></a> [parameter](#module\_parameter) | ../.. | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
