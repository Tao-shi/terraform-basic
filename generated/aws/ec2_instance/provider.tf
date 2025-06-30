provider "aws" {}

terraform {
	required_providers {
		aws = {
	    version = "~> 5.77.0"
		}
  }
}
