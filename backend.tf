terraform {
  backend "s3" {
    bucket         = "taofiq-terraform-state"
    key            = "test/1/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile = true
  }
}