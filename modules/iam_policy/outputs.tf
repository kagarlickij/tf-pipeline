output "policy_arn" {
  description = "ARN of the policy"
  value       = aws_iam_policy_s3.aws_iam_policy_s3.arn
}