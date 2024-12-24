######################################################################
# Attributes of the CBC payment
######################################################################

variable "charging_mode" {
  description = "The charging mode of the GaussDB MySQL resources"

  type    = string
  default = null
}

variable "period_unit" {
  description = "The period unit of the pre-paid purchase"

  type    = string
  default = null
}

variable "period" {
  description = "The period number of the pre-paid purchase"

  type    = number
  default = null
}

variable "auto_renew" {
  description = "Whether to automatically renew after expiration for GaussDB MySQL resources"

  type    = bool
  default = null
}

######################################################################
# Attributes of the VPC resources
######################################################################

variable "vpc_id" {
  description = "The ID of the VPC to which the GaussDB MySQL resources belongs"

  type    = string
  default = null
}

variable "subnet_id" {
  description = "The ID of the VPC subnet to which the GaussDB MySQL resources belongs"

  type    = string
  default = null
}

######################################################################
# Configuration of GaussDB MySQL resources
######################################################################

variable "force_import" {
  description = "Whether import the instance instead of creating if the name already existed"

  type    = bool
  default = false
}

variable "is_instance_create" {
  description = "Controls whether a GaussDB MySQL instance should be created (it affects all GaussDB MySQL related resources under this module)"

  type    = bool
  default = true
}

variable "name" {
  description = "The instance name"

  type    = string
  default = null
}

variable "password" {
  description = "The database password"

  type    = string
  default = null
}

variable "flavor" {
  description = "The instance specifications (e.g. gaussdb.mysql.large.x86.4)"

  type    = string
  default = null
}

variable "security_group_id" {
  description = "The security group ID"

  type    = string
  default = null
}

variable "description" {
  description = "The description of the instance"

  type    = string
  default = null
}

variable "availability_zone_mode" {
  description = "The availability zone mode"

  type    = string
  default = "single"
}

variable "master_availability_zone" {
  description = "The availability zone where the master node resides"

  type    = string
  default = null
}

variable "read_replicas" {
  description = "The count of read replicas"

  type    = number
  default = 1
}

variable "enterprise_project_id" {
  description = "The enterprise project id"

  type    = string
  default = null
}

variable "audit_log_enabled" {
  description = "Whether audit log is enabled"

  type    = bool
  default = false
}

variable "configuration_id" {
  description = "The configuration ID"

  type    = string
  default = null
}

variable "sql_filter_enabled" {
  description = "Whether sql filter is enabled"

  type    = bool
  default = false
}

variable "private_write_ip" {
  description = "The private IP address of the DB instance"

  type    = string
  default = null
}

variable "port" {
  description = "The database port"

  type    = number
  default = null
}

variable "private_dns_name_prefix" {
  description = "The prefix of the private domain name"

  type    = string
  default = null
}

variable "maintain_begin" {
  description = "The start time for a maintenance window (e.g. 22:00)"

  type    = string
  default = null
}

variable "maintain_end" {
  description = "The end time for a maintenance window (e.g. 22:00)"

  type    = string
  default = null
}

variable "ssl_option" {
  description = "Whether to enable SSL"

  type    = bool
  default = false
}

variable "table_name_case_sensitivity" {
  description = "Whether the kernel table name is case sensitive"

  type    = bool
  default = false
}

variable "time_zone" {
  description = "The time zone"

  type    = string
  default = "UTC+08:00"
}

variable "volume_size" {
  description = "The volume size of the instance"

  type    = number
  default = null
}

variable "dedicated_resource_id" {
  description = "The dedicated resource ID"

  type    = string
  default = null
}

variable "seconds_level_monitoring_enabled" {
  description = "Whether to enable seconds level monitoring"

  type    = bool
  default = false
}

variable "seconds_level_monitoring_period" {
  description = "The seconds level collection period"

  type    = number
  default = null
}

variable "slow_log_show_original_switch" {
  description = "The slow log show original switch of the instance"

  type    = bool
  default = false
}

variable "encryption_status" {
  description = "Whether to enable or disable encrypted backup"

  type    = string
  default = null
}

variable "encryption_type" {
  description = "The encryption type"

  type    = string
  default = null
}

variable "kms_key_id" {
  description = "The KMS ID"

  type    = string
  default = null
}

variable "parameters" {
  description = "The parameters to be set to the instance after launched"
  type = list(object({
    name  = string
    value = string
  }))

  default = []
}

variable "backup_strategy" {
  description = "The advanced backup policy"
  type = list(object({
    start_time = string
    keep_days  = optional(string, null)
  }))

  default = []
}

variable "auto_scaling" {
  description = "The auto-scaling policies"
  type = list(object({
    status = string

    scaling_strategy = list(object({
      flavor_switch    = string
      read_only_switch = string
    }))

    enlarge_threshold   = optional(number, null)
    max_flavor          = optional(string, null)
    max_read_only_count = optional(number, null)
    monitor_cycle       = optional(number, null)
    read_only_weight    = optional(number, null)
    reduce_enabled      = optional(bool, null)
    silence_cycle       = optional(number, null)
  }))

  default = []
}

variable "datastore" {
  description = "The database information"
  type = list(object({
    engine  = string
    version = string
  }))

  default = []
}

variable "tags" {
  description = "The the key/value pairs to associate with the GaussDB Mysql instance"

  type = map(string)
  default = {
    Creator = "terraform-huaweicloud-gaussdb-mysql"
  }
}
