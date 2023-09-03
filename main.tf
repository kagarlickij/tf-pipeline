module "s3_bucket" {
  source  = "./modules/s3_bucket"
  s3_name = var.s3_name
}

module "iam_policy" {
  source  = "./modules/iam_policy"
  /* source = "github.com/kagarlickij/tf-pipeline-iam_policy" */
  source = "git::https://github.com/kagarlickij/tf-pipeline-iam_policy.git"
  s3_name = var.s3_name
}
