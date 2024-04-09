resource "aws_ssm_parameter" "parameter" {
  name = var.name
  #checkov:skip=CKV2_AWS_34:The variable is set to SecureString by default. Since this is a re-usable module, the option to override this is necessary.
  type = var.type

  allowed_pattern = var.allowed_pattern
  data_type       = var.data_type
  description     = var.description

  insecure_value = var.insecure_value
  key_id         = var.key_id

  tier = var.tier

  value = var.value

  tags = local.tags
}
