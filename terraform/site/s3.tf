resource "aws_s3_bucket" "site" {
  bucket = "sans-devops-static-site"
}

resource "aws_s3_bucket_public_access_block" "public" {
  bucket = aws_s3_bucket.site.id

  block_public_acls   = false
  block_public_policy = false
}

resource "aws_s3_bucket_website_configuration" "site" {
  bucket = aws_s3_bucket.site.id

  index_document {
    suffix = "index.html"
  }
}
