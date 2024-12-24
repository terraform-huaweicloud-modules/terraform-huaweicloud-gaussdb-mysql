output "instance_id" {
  description = "The GaussDB MySQL instance ID"
  value       = try(huaweicloud_gaussdb_mysql_instance.instance[0].id, "")
}

output "status" {
  description = "The the GaussDB MySQL instance status"
  value       = try(huaweicloud_gaussdb_mysql_instance.instance[0].status, "")
}

output "mode" {
  description = "The the GaussDB MySQL instance mode"
  value       = try(huaweicloud_gaussdb_mysql_instance.instance[0].mode, "")
}

output "db_user_name" {
  description = "The default username"
  value       = try(huaweicloud_gaussdb_mysql_instance.instance[0].db_user_name, "")
}

output "private_dns_name" {
  description = "The private domain name"
  value       = try(huaweicloud_gaussdb_mysql_instance.instance[0].private_dns_name, "")
}

output "upgrade_flag" {
  description = "Whether the version can be upgraded"
  value       = try(huaweicloud_gaussdb_mysql_instance.instance[0].upgrade_flag, false)
}

output "current_version" {
  description = "The current database version"
  value       = try(huaweicloud_gaussdb_mysql_instance.instance[0].current_version, "")
}

output "current_kernel_version" {
  description = "The current database kernel version"
  value       = try(huaweicloud_gaussdb_mysql_instance.instance[0].current_kernel_version, "")
}

output "created_at" {
  description = "The creation time in the **yyyy-mm-ddThh:mm:ssZ** format"
  value       = try(huaweicloud_gaussdb_mysql_instance.instance[0].created_at, "")
}

output "updated_at" {
  description = "The update time in the **yyyy-mm-ddThh:mm:ssZ** format"
  value       = try(huaweicloud_gaussdb_mysql_instance.instance[0].updated_at, "")
}

output "nodes" {
  description = "The instance nodes information"
  value       = try(huaweicloud_gaussdb_mysql_instance.instance[0].nodes, [])
}

output "auto_scaling" {
  description = "The auto-scaling policies"
  value       = try(huaweicloud_gaussdb_mysql_instance.instance[0].auto_scaling, [])
}
