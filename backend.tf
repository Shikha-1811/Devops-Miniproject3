terraform {
  backend "s3" {
    bucket = "miniprojectet2211"
    key    = "terraform/backend"
    region = "us-east-2"
  }
}
