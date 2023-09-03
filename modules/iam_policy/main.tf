resource "aws_iam_policy" "aws_iam_policy_s3" {
  name = "aws_iam_policy_s3_${var.s3_name}"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["s3:GetBucketLocation", "s3:ListBucket", "s3:ListBucketMultipartUploads"]
        Effect   = "Allow"
        Resource = [
            "arn:aws:s3:::${var.s3_name}"
        ]
      },
      {
        Action   = ["s3:AbortMultipartUpload", "s3:DeleteObject", "s3:ListMultipartUploadParts", "s3:PutObject", "s3:GetObject"]
        Effect   = "Allow"
        Resource = [
            "arn:aws:s3:::${var.s3_name}/*"
        ]
      }
    ]
  })
}
