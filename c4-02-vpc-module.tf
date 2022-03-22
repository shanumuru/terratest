################################################################################
# Create VPC Terraform Module
################################################################################
# VPC Output Values
module "priyavpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.13.0"
  # insert the 23 required variables here
#vpc basic details

name =var.vpc_name # name attached to all resources created. 
cidr= var.vpc_cidr_block

azs                 = var.vpc_availability_zones
  private_subnets     = var.vpc_private_subnets
  public_subnets      = var.vpc_public_subnets


 #database subnets
  database_subnets    = var.vpc_database_subnets
  create_database_subnet_group = var.vpc_create_database_subnet_group
  create_database_subnet_route_table=var.vpc_create_database_subnet_route_table

  #create_database_nat_gateway_route = true
  #create_database_internet_gateway_route = true

  enable_nat_gateway = var.vpc_enable_nat_gateway #for private subnet to access internet for outbound commn, one way
  single_nat_gateway = var.vpc_single_nat_gateway
  # cretae_igw is true by default ,internet gateway will be created by default.
  # there are many parameters true by default, check module usage

  #vpc DNS parameters
  enable_dns_hostnames =true
  enable_dns_support=true


  public_subnet_tags ={
    Type="priya-public-subnets"
  }

    private_subnet_tags ={
    Type="priya-private-subnets"
  }

   tags = local.common_tags
  vpc_tags = local.common_tags



}


