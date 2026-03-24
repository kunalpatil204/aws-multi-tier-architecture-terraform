#S3 Creation 
resource "aws_s3_bucket" "tf_state" {
  bucket = "kunal-terraform-state-12345" # change name (must be unique)

  tags = {
    Name = "terraform-state"
  }
}

#version Enabling 
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.tf_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

#dyanamoDb Table 
resource "aws_dynamodb_table" "tf_lock" {
  name         = "terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
