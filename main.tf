variable "region" {
  default = "eu-west-2"
}

provider "aws" {
  alias  = "sandbox"
  region = var.region
  assume_role {
    role_arn = "arn:aws:iam::${var.sandbox_account_id}:role/AdministratorAccess"
  }
}

