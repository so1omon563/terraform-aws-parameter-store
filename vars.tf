variable "name" {
  type        = string
  description = "The name of the Parameter you wish to create."
}

variable "allowed_pattern" {
  type        = string
  description = "A regular expression used to validate the parameter value."
  default     = null
}

variable "data_type" {
  type        = string
  description = <<EOT
  The data type for the parameter. Valid data types are `text`, `aws:ssm:integration`, and `aws:ec2:image`.

  For AMI format, see the [Native parameter support for Amazon Machine Image IDs](https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-ec2-aliases.html).

  `aws:ssm:integration` data_type parameters must be of the type `SecureString` and the name must start with the prefix `/d9d01087-4a3f-49e0-b0b4-d568d7826553/ssm/integrations/webhook/`. See [here](https://docs.aws.amazon.com/systems-manager/latest/userguide/creating-webhook-integrations.html) for information on the usage of `aws:ssm:integration` parameters.

  EOT
  default     = "text"
}

variable "description" {
  type        = string
  description = "The description of the parameter."
  default     = "Managed by Terraform"
}

variable "insecure_value" {
  type        = string
  description = "Either this or `value` must be provided. The value of the parameter. **Use caution**: This value is never marked as sensitive in the Terraform plan output. This argument is not valid with a `type` of `SecureString`."
  default     = null
}

variable "key_id" {
  type        = string
  description = "The KMS key ID or ARN for encrypting a `SecureString`. If not provided, the default AWS managed key will be used."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "A map of tag names and values for tags to apply to all taggable resources created by the module. Default value is a blank map to allow for using Default Tags in the provider."
  default     = {}
}

variable "tier" {
  type        = string
  description = "Parameter tier to assign to the parameter. If not specified, will use the default parameter tier for the region. Valid tiers are `Standard`, `Advanced`, and `Intelligent-Tiering`. Downgrading an `Advanced` tier parameter to `Standard` will recreate the resource. For more information on parameter tiers, see the [AWS SSM Parameter tier comparison and guide](https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-advanced-parameters.html)."
  default     = null
}
variable "type" {
  type        = string
  description = "The type of the parameter. Valid types are String, StringList, and SecureString."

  validation {
    condition     = contains(["String", "StringList", "SecureString"], var.type)
    error_message = "The type must be `String`, `StringList`, or `SecureString`."
  }
  default = "SecureString"
}

variable "value" {
  type        = string
  description = "Either this or `insecure_value` must be provided. The value of the parameter. This value is always marked as sensitive in the Terraform plan output, regardless of type"
  default     = null
}
