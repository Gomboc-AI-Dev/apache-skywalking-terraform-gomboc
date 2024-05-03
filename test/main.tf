provider "aws" {
  region = "us-east-2"
}

data "aws_region" "current" {}

resource "aws_dynamodb_table" "test_table_a" {
  billing_mode = "PAY_PER_REQUEST"
  server_side_encryption {
    enabled = true
  }
  deletion_protection_enabled = true
}


resource "aws_lambda_function" "myfunction" {
  tracing_config {
    mode = "Active"
  }
}

resource "aws_appsync_graphql_api" "test_api" {
  xray_enabled        = true
  authentication_type = "API_KEY"
}

resource "aws_keyspaces_table" "mykeyspacestable" {
  encryption_specification {
    type = "AWS_OWNED_KMS_KEY"
  }
}