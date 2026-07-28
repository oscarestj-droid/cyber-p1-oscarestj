provider "aws" {
  region = "us-east-1"
}

# The Core S3 Bucket Definition (with public ACL completely removed)
resource "aws_s3_bucket" "secure_bucket" {
  bucket = "titan-secured-quality-bucket-${random_id.bucket_id.hex}"
}

# Generate a random ID to ensure global S3 bucket name uniqueness
resource "random_id" "bucket_id" {
  byte_length = 4
}

# Fix 1: Explicitly Block All Public Access Paths (aws-s3-no-public-access-block)
resource "aws_s3_bucket_public_access_block" "public_block" {
  bucket                  = aws_s3_bucket.secure_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Fix 2: Enable Server-Side Encryption (aws-s3-encryption-customer-key)
resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.secure_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Fix 3: Enable Bucket Versioning (aws-s3-enable-versioning)
resource "aws_s3_bucket_versioning_configuration" "versioning" {
  bucket = aws_s3_bucket.secure_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
