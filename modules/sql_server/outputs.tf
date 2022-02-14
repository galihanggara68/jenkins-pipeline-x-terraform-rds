output "this_db_instance_id" {
    value = alicloud_db_instance.instance.id
}
output "this_db_instance_name" {
  description = "Rds instance name."
  value       = alicloud_db_instance.instance.instance_name
}
#################
# Rds instance connection
#################
output "this_db_instance_connection_string" {
  description = "Rds instance public connection string"
  value       = alicloud_db_instance.instance.connection_string
}
output "this_db_instance_port" {
  description = "Rds instance public connection string"
  value       =alicloud_db_instance.instance.port
}
output "this_db_instance_connection_ip_address" {
  description = "Rds instance public connection string's ip address"
  value       = alicloud_db_instance.instance.private_ip_address
}

#################
# Rds database account
#################
output "this_db_database_account" {
  description = "Rds database account."
  value       = alicloud_db_account.account.*.name
}

output "this_db_database_account_type" {
  description = "Rds database account type."
  value       = alicloud_db_account.account.*.account_type
}