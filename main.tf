module "s3_bucket" {
  source  = "./modules/s3_bucket"
  s3_name = var.s3_name
}

module "iam_policy" {
  source  = "./modules/iam_policy"
  s3_name = var.s3_name
}
