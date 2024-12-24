data "huaweicloud_gaussdb_mysql_flavors" "test" {
  engine                 = "gaussdb-mysql"
  version                = "8.0"
  availability_zone_mode = "multi"
}

resource "huaweicloud_gaussdb_mysql_instance" "instance" {
  count = var.is_instance_create ? 1 : 0

  force_import             = try(var.force_import, null)

  name                        = var.name
  password                    = var.password
  flavor                      = var.flavor
  vpc_id                      = var.vpc_id
  subnet_id                   = var.subnet_id
  security_group_id           = try(var.security_group_id, null)
  description                 = try(var.description, null)
  availability_zone_mode      = try(var.availability_zone_mode, null)
  master_availability_zone    = try(var.master_availability_zone, null)
  read_replicas               = try(var.read_replicas, null)
  enterprise_project_id       = try(var.enterprise_project_id, null)
  audit_log_enabled           = try(var.audit_log_enabled, null)
  configuration_id            = try(var.configuration_id, null)
  sql_filter_enabled          = try(var.sql_filter_enabled, null)
  private_write_ip            = try(var.private_write_ip, null)
  port                        = try(var.port, null)
  private_dns_name_prefix     = try(var.private_dns_name_prefix, null)
  maintain_begin              = try(var.maintain_begin, null)
  maintain_end                = try(var.maintain_end, null)
  ssl_option                  = try(var.ssl_option, null)
  table_name_case_sensitivity = try(var.table_name_case_sensitivity, null)
  time_zone                   = try(var.time_zone, null)
  volume_size                 = try(var.volume_size, null)
  dedicated_resource_id       = try(var.dedicated_resource_id, null)

  seconds_level_monitoring_enabled = try(var.seconds_level_monitoring_enabled, null)
  seconds_level_monitoring_period  = try(var.seconds_level_monitoring_period, null)

  slow_log_show_original_switch = try(var.slow_log_show_original_switch, null)

  encryption_status = try(var.encryption_status, null)
  encryption_type   = try(var.encryption_type, null)
  kms_key_id        = try(var.kms_key_id, null)

  // .parameters
  dynamic "parameters" {
    for_each = lookup(element(var.parameters, count.index), "parameters") != null ? [lookup(element(var.parameters, count.index), "parameters")] : []
    content {
      name  = parameters.value["name"]
      value = parameters.value["value"]
    }
  }

  // .backup_strategy
  dynamic "backup_strategy" {
    for_each = lookup(element(var.backup_strategy, count.index), "backup_strategy") != null ? [lookup(element(var.backup_strategy, count.index), "backup_strategy")] : []
    content {
      start_time = backup_strategy.value["start_time"]
      keep_days  = try(backup_strategy.value["keep_days"], null)
    }
  }

  // .auto_scaling
  dynamic "auto_scaling" {
    for_each = lookup(element(var.auto_scaling, count.index), "auto_scaling") != null ? [lookup(element(var.auto_scaling, count.index), "auto_scaling")] : []
    content {
      status = auto_scaling.value["status"]

      // .auto_scaling.scaling_strategy
      dynamic "scaling_strategy" {
        for_each = lookup(element(auto_scaling.value["scaling_strategy"], count.index), "scaling_strategy") != null ? [lookup(element(auto_scaling.value["scaling_strategy"], count.index), "scaling_strategy")] : []
        content {
          flavor_switch    = scaling_strategy.value["flavor_switch"]
          read_only_switch = scaling_strategy.value["read_only_switch"]
        }
      }

      enlarge_threshold   = try(auto_scaling.value["enlarge_threshold"], null)
      max_flavor          = try(auto_scaling.value["max_flavor"], null)
      max_read_only_count = try(auto_scaling.value["max_read_only_count"], null)
      monitor_cycle       = try(auto_scaling.value["monitor_cycle"], null)
      read_only_weight    = try(auto_scaling.value["read_only_weight"], null)
      reduce_enabled      = try(auto_scaling.value["reduce_enabled"], null)
      silence_cycle       = try(auto_scaling.value["silence_cycle"], null)
    }
  }

  // .datastore
  dynamic "datastore" {
    for_each = lookup(element(var.datastore, count.index), "datastore") != null ? [lookup(element(var.datastore, count.index), "datastore")] : []
    content {
      engine  = datastore.value["engine"]
      version = datastore.value["version"]
    }
  }

  tags = try(var.tags, null)

  charging_mode = try(var.charging_mode, null)
  period_unit   = try(var.period_unit, null)
  period        = try(var.period, null)
  auto_renew    = try(var.auto_renew, null)
}
