# SSM Parameter Store Parameter

Creates a paremeter in SSM Parameter Store. Supports all standard options for the SSM Parameter resource.

Note that by default, this module creates a `text`, `SecureString` parameter encrypted with the AWS managed KMS key. These options can be changed by passing in variables as outlined below.

### Populating the parameter value

This module is designed to create a parameter by passing in a variable at run-time. **DO NOT** place your parameters in an open source control. They should be treated as sensitive values, and stored accordingly (Using encryption, etc).

There are two input variables associated with passing in a parameter value - `value`, and `insecure_value` - as outlined in the `Input Variables` section below.

One or the other of these options must be passed in. It is not possible to create a parameter without a value.

There are multiple options for passing in the parameter value.

The most common options include:

#### Use a .tfvars file

Use a `terraform.tfvars` file that contains the `value`.

Make sure that you have `terraform.tfvars` in your `.gitignore` so it doesn't accidentally get committed.

An example of the format for that is here:

```hcl

# terraform.tfvars

value = "string_value"

```

#### Pass in input variable on command line

Pass in the value of `value`, or `insecure_value` on the command line when running Terraform.

An example of `value` is here:

```shell

terraform apply -var="value=string_value"

```

Depending on how you are calling the module, this option may not always work as expected.

#### Pass in input variable using environment variables

You can also set your input variable as an environment variable in your shell prior to running Terraform.

An example of `value` is here:

```shell

export TF_VAR_value=string_value
terraform apply

```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

Auto-generated technical documentation is created using [`terraform-docs`](https://terraform-docs.io/)
## Examples

```hcl
# See examples under the top level examples directory for more information on how to use this module.
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.44.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ssm_parameter.parameter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_pattern"></a> [allowed\_pattern](#input\_allowed\_pattern) | A regular expression used to validate the parameter value. | `string` | `null` | no |
| <a name="input_data_type"></a> [data\_type](#input\_data\_type) | The data type for the parameter. Valid data types are `text`, `aws:ssm:integration`, and `aws:ec2:image`.<br><br>  For AMI format, see the [Native parameter support for Amazon Machine Image IDs](https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-ec2-aliases.html).<br><br>  `aws:ssm:integration` data\_type parameters must be of the type `SecureString` and the name must start with the prefix `/d9d01087-4a3f-49e0-b0b4-d568d7826553/ssm/integrations/webhook/`. See [here](https://docs.aws.amazon.com/systems-manager/latest/userguide/creating-webhook-integrations.html) for information on the usage of `aws:ssm:integration` parameters. | `string` | `"text"` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the parameter. | `string` | `"Managed by Terraform"` | no |
| <a name="input_insecure_value"></a> [insecure\_value](#input\_insecure\_value) | Either this or `value` must be provided. The value of the parameter. **Use caution**: This value is never marked as sensitive in the Terraform plan output. This argument is not valid with a `type` of `SecureString`. | `string` | `null` | no |
| <a name="input_key_id"></a> [key\_id](#input\_key\_id) | The KMS key ID or ARN for encrypting a `SecureString`. If not provided, the default AWS managed key will be used. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Parameter you wish to create. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tag names and values for tags to apply to all taggable resources created by the module. Default value is a blank map to allow for using Default Tags in the provider. | `map(string)` | `{}` | no |
| <a name="input_tier"></a> [tier](#input\_tier) | Parameter tier to assign to the parameter. If not specified, will use the default parameter tier for the region. Valid tiers are `Standard`, `Advanced`, and `Intelligent-Tiering`. Downgrading an `Advanced` tier parameter to `Standard` will recreate the resource. For more information on parameter tiers, see the [AWS SSM Parameter tier comparison and guide](https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-advanced-parameters.html). | `string` | `null` | no |
| <a name="input_type"></a> [type](#input\_type) | The type of the parameter. Valid types are String, StringList, and SecureString. | `string` | `"SecureString"` | no |
| <a name="input_value"></a> [value](#input\_value) | Either this or `insecure_value` must be provided. The value of the parameter. This value is always marked as sensitive in the Terraform plan output, regardless of type | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_parameter"></a> [parameter](#output\_parameter) | A map of properties for the created SSM Parameter. |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
