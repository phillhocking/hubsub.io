terraform {
  required_version = ">= 0.14.0"

required_providers {
    aws = {
      source     = "hashicorp/aws"
      version    = "~> 3.32"
      region     = var.aws_region
      access_key = var.access_key
      secret_key = var.secret_key
    }

    local = {
      source  = "hashicorp/local"
      version = "~> 2.1"
    }
  }
}
