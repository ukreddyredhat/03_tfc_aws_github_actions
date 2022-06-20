terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.19.0"
    }
  }
}

# Configuration AWS Provider
provider "aws" {
  region = "eu-central-1"
}