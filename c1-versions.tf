################################################################################
# Terraform Block
################################################################################
terraform {
  required_version = "~>1.1"
  required_providers {
    #map argument , local name
    aws = {
      source = "hashicorp/aws"
      version = "~>4.2.0"
     }
    
  }

  # Adding Backend as S3 for Remote State Storage testing pr again
  
backend "s3" { 

  bucket = "priyaterraform-on-aws-for-ec2"
  key = "dev/project1-vpc/terraform.tfstate" #location of the tfstate fie in s3s
  region = "us-east-1"

#dynamodb for state locking
  dynamodb_table = "dev-project1-vpc"
  
}
    
}
 
################################################################################
# Provider Block
################################################################################


provider "aws" {
  region = var.aws_region
  #profile = default
}
/*
Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/
