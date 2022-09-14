variable "region" {
  default = "eu-west-2"
}
#raj added a new jhkhkjh comment
#raj added another new comment
provider "aws" {
  alias  = "sandbox"
  region = var.region
  assume_role {
    role_arn = "arn:aws:iam::${var.sandbox_account_id}:role/AdministratorAccess"
  }
}

resource "aws_s3_bucket" "foo-bucket" {
  region        = var.region
  bucket        = "fred"
  force_destroy = true

  tags = {
    Name = "foo-${data.aws_caller_identity.current.account_id}"
  }
  versioning {
    enabled = true
  }
  logging {
    target_bucket = "${aws_s3_bucket.log_bucket.id}"
    target_prefix = "log/"
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "${aws_kms_key.mykey.arn}"
        sse_algorithm     = "aws:kms"
      }
    }
  }
  acl           = "private"
}

#call a module
#fred is here
#hello world
module "raj_otherstuff" {
  source = "./modules/otherstuff"
}
