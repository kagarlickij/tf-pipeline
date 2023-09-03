output "bucket_arn" {
  description = "ARN of the bucket"
  value       = module.s3_bucket.bucket_arn
}

output "policy_arn" {
  description = "ARN of the policy"
  value       = module.iam_policy.policy_arn
}
