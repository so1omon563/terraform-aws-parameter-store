module "sns_topic_policy" {
  source  = "so1omon563/sns/aws//modules/sns_topic_policy"
  version = "2.0.0" # Replace with appropriate version
  arn     = "<arn_of_topic>"
  policy  = "<json_policy_to_attach>"
}
