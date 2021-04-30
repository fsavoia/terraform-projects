# Create s3 bucket to store tfstate files 
resource "aws_s3_bucket" "terraform-tfstate-storage" {
  bucket = var.bucket_name
  acl    = "private"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = false
    #prevent_destroy = true
  }

}
# Create Dynamo table for lock file
resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "terraform-state-lock"
  hash_key = "LockID"
  read_capacity = 2
  write_capacity = 2

  attribute {
    name = "LockID"
    type = "S"
  }

}