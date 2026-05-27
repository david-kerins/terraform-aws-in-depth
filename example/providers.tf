terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
variable "region" {
  type        = string
  default     = "ca-central-1"
  description = "The AWS Region to connect and run the tests in."
}
provider "aws" {
  region = var.region
}
