resource "aws_kms_key" "athena_kms_key" {
  deletion_window_in_days = 7
  description             = "Athena KMS Key"
}

resource "aws_athena_database" "vpc_flowlog_athena" {
  name   = "vpc_flowlog_athena"
  bucket = aws_s3_bucket.vpc_flowlog_bucket.id
}

resource "aws_athena_workgroup" "vpc_flowlog_s3_wg" {
  name = "vpc_flowlog_s3_wg"
  
  configuration {
    bytes_scanned_cutoff_per_query = 10485760
    result_configuration {
      encryption_configuration {
        encryption_option = "SSE_KMS"
        kms_key_arn       = aws_kms_key.athena_kms_key.arn
      }
    }
  }
}

resource "aws_athena_named_query" "athena_s3_query" {
  name      = "athena_s3_query"
  workgroup = aws_athena_workgroup.vpc_flowlog_s3_wg.id
  database  = aws_athena_database.vpc_flowlog_athena.name
  query     = "SELECT * FROM ${aws_athena_database.vpc_flowlog_athena.name} limit 10;"
}