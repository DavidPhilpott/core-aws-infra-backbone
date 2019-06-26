resource "aws_sns_topic" "core_message_inbox" {
  name = "core-message-inbox"

  tags = merge(
    {
      "Name" = aws_sns_topic.core_message_inbox.name
    },
    local.common_tags
  )
}

resource "aws_sns_topic_policy" "core_message_inbox_topic_policy" {
  arn    = aws_sns_topic.core_message_inbox.arn
  policy = data.aws_iam_policy_document.core_message_inbox_topic_policy_document.json
}

data "aws_iam_policy_document" "core_message_inbox_topic_policy_document" {
  statement {
    actions = [
      "SNS:Subscribe",
      "SNS:SetTopicAttributes",
      "SNS:RemovePermission",
      "SNS:Receive",
      "SNS:Publish",
      "SNS:ListSubscriptionsByTopic",
      "SNS:GetTopicAttributes",
      "SNS:AddPermission",
    ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceOwner"

      values = [
        "${var.aws_account_id}",
      ]
    }

    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = [
      "${aws_sns_topic.core_message_inbox.arn}",
    ]

  }
}