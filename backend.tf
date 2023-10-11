terraform {
  backend "s3" {
    bucket         = "ta-silpa-migration-tfstate"
    key            = "tf-modules/vpc/terraform.tfstates"
    region         = "eu-central-1"
    dynamodb_table = "terraform-lock"
  }
}