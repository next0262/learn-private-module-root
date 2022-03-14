terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0.0"
    }
  }

  cloud {
    organization = "poseidonos"

    workspaces {
      name = "learn-private-module-root"
    }
  }
}

provider "aws" {
  region = var.region
}

module "s3-webapp" {
  source  = "app.terraform.io/poseidonos/s3-webapp/aws"
  name    = var.name
  region  = var.region
  prefix  = var.prefix
  version = "1.0.0"
}
