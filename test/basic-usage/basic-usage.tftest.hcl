# Some basic unit testing to verify that selected outputs of the main module return expected results.
# In order to reduce testing cost, only items that can be verified via a `terraform plan` are being tested here.

run "verify_sns_outputs_plan" {
  command = plan
  assert {
    condition     = module.sns_topic.topic.tags_all.Name == format("%s-%s", var.name, var.topic_prefix)
    error_message = "Name Tag did not match expected result."
  }
  assert {
    condition     = module.sns_topic.topic.tags_all.example == "true" && module.sns_topic.topic.tags_all.environment == "dev" && module.sns_topic.topic.tags_all.terraform == "true"
    error_message = "One or more tags did not match expected result."
  }
}
