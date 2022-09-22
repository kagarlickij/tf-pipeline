output "website_bucket_arn" {
  description = "ARN of the bucket"
  value       = module.s3_bucket.arn
}
