terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
}

terraform {
  backend "s3" {
    key    = "tf-pipeline/terraform.tfstate"
  }
}
