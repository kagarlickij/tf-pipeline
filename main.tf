module "s3_bucket" {
  source  = "./modules/s3_bucket"
  s3_name = var.s3_name
}
