variable "name" {
  description = "vpc name"
  #default     = "ca-central-1"
}

variable "region" {
  description = "aws region"
  #default     = "ca-central-1"
}

variable "environment" {
  description = "component environment"
  #default = "development"
}

variable "cidr" {
  description = "cidr for the vpc"
  #default = "10.0.0.0/16"
}

variable "cidr_subnet_1" {
  description = "cidr for subnet a"
  #default = "10.0.1.0/24"
}

variable "subnet_1_availability_zone" {
  description = "Subnet Availability Zone"
  #default = "10.0.1.0/24"
}

variable "cidr_subnet_2" {
  description = "cidr for subnet b"
  #default = "10.0.2.0/24"
}

variable "subnet_2_availability_zone" {
  description = "Subnet Availability Zone"
  #default = "10.0.1.0/24"
}