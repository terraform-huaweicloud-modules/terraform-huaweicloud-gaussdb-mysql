######################################################################
# Attributes of the VPC resources
######################################################################

variable "vpc_name" {
  description = "The name of the VPC to which the GaussDB MySQL resources"

  type = string
}

variable "vpc_cidr" {
  description = "The CIDR of the VPC to which the GaussDB MySQL resources"

  type = string
}

variable "subnets_configuration" {
  description = "The configuration of the subnet resources to which the GaussDB MySQL resources belongs"

  type = list(object({
    name = string
    cidr = string
  }))
}

variable "security_group_name" {
  description = "The name of the security group to which the GaussDB MySQL instance belongs"

  type = string
}

######################################################################
# Configuration of GaussDB MySQL resources
######################################################################

variable "flavor" {
  description = "The instance specifications (e.g. gaussdb.mysql.large.x86.4)"

  type = string
}

variable "name" {
  description = "The instance name"

  type = string
}

variable "master_availability_zone" {
  description = "The availability zone where the master node resides"

  type = string
}

variable "availability_zone_mode" {
  description = "The availability zone mode"

  type = string
}

