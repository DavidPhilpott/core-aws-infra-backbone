resource "aws_ssm_parameter" "core_message_inbox_arn_parameter" {
  name        = "core-message-inbox-arn-${var.environment}"
  description = "ARN of the ${var.environment} core message inbox."
  type        = "String"
  value       = aws_sns_topic.core_message_inbox.arn
  
  tags = merge(
    {
      "Name" = "core-message-inbox-arn-${var.environment}"
    },
    local.common_tags
  )
}
