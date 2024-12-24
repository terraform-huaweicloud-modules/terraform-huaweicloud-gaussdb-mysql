# Simple instance

Configuration in this directory creates a simple GaussDB MySQL instance.

Referring to this use case, you can write a basic GaussDB MySQL instance script.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Node that this example will create some resources and spend a little money.
Run `terraform destory` when you don't need them.

## Requirement

| Name        | Version   |
|-------------|-----------|
| Terraform   | >= 1.3.0  |
| HuaweiCloud | >= 1.70.0 |
| Random      | >= 3.0.0  |

## Providers

[terraform-provider-huaweicloud](https://github.com/huaweicloud/terraform-provider-huaweicloud)

## Modules

| Name | Source | Version |
|--|--------|---------|
| gaussdb_mysql | [../..](../../README.md) | N/A |
| vpc | [terraform-huaweicloud-vpc] | N/A |

## Resources

| Name | Type |
|------|------|
| random_password.this[0] | resource |
| huaweicloud_vpc.this[0] | resource |
| huaweicloud_vpc_subnet.this[0] | resource |
| huaweicloud_gaussdb_mysql_instance.this[0] | resource |

## Inputs

| Name | Description | Type | Default Value |
|------|-------------|------|-------------|
| vpc_name | The name of the VPC to which the GaussDB MySQL resources | string | N/A |
| vpc_cidr | The CIDR of the VPC to which the GaussDB MySQL resources | string | N/A |
| subnets_configuration | The configuration of the subnet resources to which the GaussDB MySQL resources belongs | <pre>list(object({<br>  name = string<br>  cidr=string}))</pre> | N/A |
| security_group_name | The name of the security group to which the ECS instance belongs | string | N/A |
| name | The instance name | string | N/A |
| flavor | The instance specifications (e.g. gaussdb.mysql.large.x86.4) | string | N/A |
| master_availability_zone | The availability zone where the master node resides | string | N/A |
| availability_zone_mode | The availability zone mode | string | N/A |
