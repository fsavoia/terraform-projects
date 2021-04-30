terraform {
  backend "s3" {
    bucket         = "terraform-state-savoiazeal"
    key            = "demo.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    profile        = "sts-demo"
  }
}