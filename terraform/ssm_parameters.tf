resource "aws_ssm_parameter" "core_message_inbox_arn_parameter" {
  name        = "core-message-inbox-arn"
  description = "ARN of the core message inbox."
  type        = "String"
  value       = aws_ssm_parameter.core_message_inbox.arn
  
  tags = merge(
    {
      "Name" = "core-message-inbox-arn"
    },
    local.common_tags
  )
}
