variable "env" {
  description = "env name"
  type        = string
  default     = "prd"
}

variable "name" {
  description = "The name for the VPC"
  type        = string
  default     = "onul"
}

variable "cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.10.0.0/16"
}

variable "public_subnets" {
  description = "CIDR list of public subnets"
  type        = list(string)
  default     = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24", "10.10.4.0/24"]
}

variable "private_subnets" {
  description = "CIDR list of private subnets"
  type        = list(string)
  default     = ["10.10.101.0/24", "10.10.102.0/24", "10.10.103.0/24", "10.10.104.0/24"]
}

variable "rds_subnets" {
  description = "CIDR list of rds subnets"
  type        = list(string)
  default     = ["10.10.201.0/24", "10.10.202.0/24",  "10.10.203.0/24", "10.10.204.0/24"]
}

variable "rds_storage" {
  description = "rds storage"
  type        = number
  default     = 20
}

variable "db_engine" {
  description = "rds database engine"
  type        = string
  default     = "mysql"
}

variable "db_engine_version" {
  description = "rds database engine version"
  type        = string
  default     = "8.0.35"
}

variable "db_instance_class" {
  description = "rds instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "db_user_name" {
  description = "database user name"
  type        = string
  default     = "root"
}

variable "db_password" {
  description = "database user password"
  type        = string
  sensitive = true
}

variable "database_name" {
  description = "first database name"
  type        = string
  default     = "onul"
}

variable "database_port" {
  description = "allow port number"
  type        = number
  default     = 3306
}

variable "domain_name" {
  description	= "thargoo.com domain"
  type			= string
  default		= "*.thragoo.com"
}

