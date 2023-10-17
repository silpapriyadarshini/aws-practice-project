################################################################################
#                       Setup Flowlog for VPC in S3                       #
################################################################################


resource "aws_flow_log" "vpc_flowlog" {
  log_destination      = aws_s3_bucket.vpc_flowlog_bucket.arn
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = data.aws_vpc.my_vpc.id
}

resource "aws_s3_bucket" "vpc_flowlog_bucket" {
  bucket = "vpc-flowlog-bucket-eu-central-1"
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.vpc_flowlog_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "vpc-flowlog-bucket-acl" {
  depends_on = [aws_s3_bucket_ownership_controls.example]

  bucket = aws_s3_bucket.vpc_flowlog_bucket.id
  acl    = "private"
}