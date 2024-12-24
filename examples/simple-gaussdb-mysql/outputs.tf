output "instance_id" {
  description = "The GaussDB MySQL instance ID"

  value = module.gaussdb_mysql_service.instance_id
}

output "instance_status" {
  description = "The the GaussDB MySQL instance status"

  value = module.gaussdb_mysql_service.status
}
