terraform {
  backend "s3" {
    bucket         = "ta-silpa-migration-tfstate"
    key            = "tf-modules/flowlog/terraform.tfstates"
    region         = "eu-central-1"
    dynamodb_table = "terraform-lock"
  }
}