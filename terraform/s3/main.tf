provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "dsa-cloud-dw-20230713"

  acl = "private"
  tags = {
    Name = "My Terraform Bucket"
  }
}

resource "aws_s3_object" "my_folder" {
  bucket = aws_s3_bucket.my_bucket.id
  key    = "data/"
}

resource "aws_s3_object" "my_files" {
  for_each = fileset("${path.cwd}/data", "**/*")

  bucket  = aws_s3_bucket.my_bucket.id
  key     = "data/${each.value}"
  content = filebase64("${path.cwd}/data/${each.value}")
}
