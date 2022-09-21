terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  access_key = "AKIARZVSUXBIYAMP2MKY"
  secret_key = "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"
}
