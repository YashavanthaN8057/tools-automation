terraform {
  backend "s3" {
    bucket = "b59-yashn-8057-yashvanth-7349"
    key    = "expense-tools/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {}