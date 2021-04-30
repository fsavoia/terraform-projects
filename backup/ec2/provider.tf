provider "aws" {
  region     = var.region
}

locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}