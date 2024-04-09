output "parameter" {
  value       = { for key, value in aws_ssm_parameter.parameter : key => value }
  description = "A map of properties for the created SSM Parameter."
}
