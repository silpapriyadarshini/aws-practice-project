# resource "aws_kms_key" "athena_kms_key" {
#   deletion_window_in_days = 7
#   description             = "Athena KMS Key"
# }

# resource "aws_athena_workgroup" "athena_s3_wg" {
#   name = "athena_s3_wg"

#   configuration {
#     result_configuration {
#       output_location = "s3://${aws_s3_bucket.vpc_flowlog_bucket.bucket}/"

#       encryption_configuration {
#         encryption_option = "SSE_KMS"
#         kms_key_arn       = aws_kms_key.athena_kms_key.arn
#       }
#     }
#   }
# }

resource "aws_athena_database" "athena_vpc_flowlog" {
  name   = "athena_vpc_flowlog"
  bucket = aws_s3_bucket.vpc_flowlog_bucket.bucket
  force_destroy = true   //(Default: false) All tables should be deleted from the db so that the db can be destroyed without error.
}

resource "aws_athena_named_query" "table_schema" {
  name      = "vpc-create-table-query"
  # workgroup = aws_athena_workgroup.athena_s3_wg.id
  database  = aws_athena_database.athena_vpc_flowlog.name
  query = <<-EOF

  CREATE EXTERNAL TABLE IF NOT EXISTS test_table_vpclogs (
  version int,
  account_id string,
  interface_id string,
  srcaddr string,
  dstaddr string,
  srcport int,
  dstport int,
  protocol bigint,
  packets bigint,
  bytes bigint,
  start bigint,
  `end` bigint,
  action string,
  log_status string,
  vpc_id string,
  subnet_id string,
  instance_id string,
  tcp_flags int,
  type string,
  pkt_srcaddr string,
  pkt_dstaddr string,
  az_id string,
  sublocation_type string,
  sublocation_id string,
  pkt_src_aws_service string,
  pkt_dst_aws_service string,
  flow_direction string,
  traffic_path int
)
PARTITIONED BY (region string, day string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ' '
LOCATION 's3://vpc-flowlog-bucket-eu-central-1/AWSLogs/398649119307/vpcflowlogs/'
TBLPROPERTIES
(
"skip.header.line.count"="1",
)

EOF

}

# resource "aws_athena_named_query" "vpc_flow_logs_query" {
#   name      = "vpc-flow-logs-query"
#   workgroup = aws_athena_workgroup.athena_s3_wg.id
#   database  = aws_athena_database.athena_vpc_flowlog.name
#   query     = "SELECT * FROM ${aws_athena_database.athena_vpc_flowlog.name} limit 20;"
# }

# resource "aws_athena_named_query" "vpc_flow_logs_ip" {
#   name      = "vpc-flow-logs-query-iprange"
#   workgroup = aws_athena_workgroup.athena_s3_wg.id
#   database  = aws_athena_database.athena_vpc_flowlog.name
#   query     = "SELECT * FROM table_vpc_logs WHERE dstaddr = '192.168.0.0' limit 20;"
# }