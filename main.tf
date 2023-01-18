locals {
  name_prefix = "terraform-learning"
}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "s3-1" {
  bucket = "${local.name_prefix}-1st-bucket"

  depends_on = []

  tags = {
    Name = "${local.name_prefix}-1st-bucket"
  }
}

resource "aws_s3_bucket" "s3-2" {
  bucket = "${local.name_prefix}-2nd-bucket"

  depends_on = [aws_s3_bucket.s3-1]

  tags = {
    Name = "${local.name_prefix}-2nd-bucket"
  }
}

resource "aws_s3_bucket" "s3-3" {
  bucket = "${local.name_prefix}-3rd-bucket"

  depends_on = [aws_s3_bucket.s3-1, aws_s3_bucket.s3-2]

  tags = {
    Name = "${local.name_prefix}-3rd-bucket"
  }
}
