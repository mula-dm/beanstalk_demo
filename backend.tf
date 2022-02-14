
# Backend configuration
# https://www.terraform.io/language/settings/backends/s3

 terraform {
   backend "s3" {
     bucket = "aws_demo"
     key    = "terraform"
     region = "us-east-1"
   }
 }
