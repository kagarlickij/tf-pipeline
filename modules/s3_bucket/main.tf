resource "aws_s3_bucket" "aws_s3_bucket" {
  bucket = var.s3_name

  tags = {
    KEY1        = "VAL1 (common)"
  }
}
