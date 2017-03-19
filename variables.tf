variable "name" {
  description = "vpc name"
  #default     = "ca-central-1"
}

variable "region" {
  description = "aws region"
  #default     = "ca-central-1"
}

variable "cidr" {
  description = "cidr for the vpc"
  #default = "10.0.0.0/16"
}

variable "cidr_subnet_a" {
  description = "cidr for subnet a"
  #default = "10.0.1.0/24"
}

variable "cidr_subnet_b" {
  description = "cidr for subnet b"
  #default = "10.0.2.0/24"
}

variable "environment" {
  description = "component environment"
  #default = "development"
}
