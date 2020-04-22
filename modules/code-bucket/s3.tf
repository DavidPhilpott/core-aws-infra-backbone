resource "aws_s3_bucket" "data_lake" {
  bucket = "dp-code-bucket-${var.environment}"
  acl    = "private"

  tags = merge(
    {
      "Name" = "code-bucket-${var.environment}"
    },
    local.common_tags
  )
}