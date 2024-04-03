terraform {
  required_version = ">= 1.7.5"

  required_providers {
    aws = "~> 4.63.0"
  }

  cloud {
    organization = "jeongminkyo"

    workspaces {
      name = "jailgas"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "network" {
  source          = "git@github.com:jeongminkyo/terraform-module.git//network?ref=v0.0.1"
  name            = var.name
  cidr            = var.cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  rds_subnets     = var.rds_subnets
  env             = var.env
}

#module "sg" {
#  source = "git@github.com:jeongminkyo/terraform-module.git//sg?ref=v0.0.1"
#  vpc_id = module.network.id
#  env    = var.env
#  name   = var.name
#  cidr   = var.cidr
#}
#
#module "rds" {
#  source                 = "git@github.com:jeongminkyo/terraform-module.git//rds?ref=v0.0.1"
#  env                    = var.env
#  name                   = var.name
#  private_rds_subnets_id = module.network.rds_subnets
#  rds_storage            = var.rds_storage
#  db_engine              = var.db_engine
#  db_engine_version      = var.db_engine_version
#  db_instance_class      = var.db_instance_class
#  db_user_name           = var.db_user_name
#  db_password            = var.db_password
#  database_name          = var.database_name
#  database_port          = var.database_port
#  security_groups_id     = module.sg.db
#}
#
#module "key-pair" {
#  source	= "git@github.com:jeongminkyo/terraform-module.git//key-pair?ref=v0.0.1"
#  env		= var.env
#  name      = var.name
#}
#
#module "acm" {
#  source			= "git@github.com:jeongminkyo/terraform-module.git//acm?ref=v0.0.1"
#  domain_name		= var.domain_name
#}
#
#module "beanstalk" {
#  source			= "git@github.com:jeongminkyo/terraform-module.git//beanstalk?ref=v0.0.1"
#  name				= var.name
#  env				= var.env
#  vpc_id			= module.network.id
#  public_subnets	= module.network.public_subnets
#  instance_type		= "t3.micro"
#  keypair			= module.key-pair.key-pair
#  certificate		= module.acm.certificate
#  security_groups	= join(",", module.sg.ec2_security_groups)
#}