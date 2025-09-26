terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
  bucket         = aws_s3_bucket.remote_bucket.bucket
  key            = "terraform.tfstate"
  region         = "us-east-1"
  dynamodb_table = aws_dynamodb_table.basic-dynamodb-table.name
  encrypt        = true
}
}

