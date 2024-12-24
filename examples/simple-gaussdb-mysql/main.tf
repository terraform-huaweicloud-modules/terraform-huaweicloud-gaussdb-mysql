resource "random_password" "this" {
  length           = 16
  special          = true
  min_numeric      = 1
  min_special      = 1
  min_lower        = 1
  min_upper        = 1
  override_special = "!#"
}

module "vpc_service" {
  source = "github.com/terraform-huaweicloud-modules/terraform-huaweicloud-gaussdb-mysql"

  vpc_name              = var.vpc_name
  vpc_cidr              = var.vpc_cidr
  subnets_configuration = var.subnets_configuration
  security_group_name   = var.security_group_name
}

module "gaussdb_mysql_service" {
  source = "../.."

  vpc_id            = module.vpc_service.vpc_id
  subnet_id         = try(module.vpc_service.subnet_ids[0], "")
  security_group_id = module.vpc_service.security_group_id

  flavor                   = var.flavor
  name                     = var.name
  password                 = random_password.this.result
  master_availability_zone = var.master_availability_zone
  availability_zone_mode   = var.availability_zone_mode
}
