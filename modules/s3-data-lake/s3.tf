//S3 Bucket acting as a data lake for all incoming data
resource "aws_s3_bucket" "data_lake" {
  bucket = "dp-core-data-lake-${var.environment}"
  acl    = "private"

  tags = merge(
    {
      "Name" = "core-data-lake-${var.environment}"
    },
    local.common_tags
  )
}