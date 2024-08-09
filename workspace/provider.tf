terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.60.0"
    }
  }

  backend "s3" {
    bucket = "roboshop-lock"
    key    = "statelock"
    region = "us-east-1"
    dynamodb_table = "roboshop-lock-db"
  }

}

provider "aws" {
  region = "us-east-1"
}
