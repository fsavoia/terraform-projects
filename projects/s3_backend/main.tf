provider "aws" {
  region     = var.region
  profile    = "sts-demo"
}

module "s3_backend" {
  source         = "../../modules/aws/s3_backend"

  bucket_name    = var.bucket_name
  region         = var.region
}