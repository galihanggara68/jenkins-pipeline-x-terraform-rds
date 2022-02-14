#################
# Rds Instance
#################
output "this_db_instance_id" {
  description = "Rds instance id."
  value       = module.sql_server.this_db_instance_id
}
output "this_db_instance_name" {
  description = "Rds instance name."
  value       = module.sql_server.this_db_instance_name
}
#################
# Rds instance connection
#################
output "this_db_instance_connection_string" {
  description = "Rds instance public connection string"
  value       = module.sql_server.this_db_instance_connection_string
}
output "this_db_instance_port" {
  description = "Rds instance public connection string"
  value       = module.sql_server.this_db_instance_port
}
output "this_db_instance_connection_ip_address" {
  description = "Rds instance public connection string's ip address"
  value       = module.sql_server.this_db_instance_connection_ip_address
}

#################
# Rds database account
#################
output "this_db_database_account" {
  description = "Rds database account."
  value       = module.sql_server.this_db_database_account
}

output "this_db_database_account_type" {
  description = "Rds database account type."
  value       = module.sql_server.this_db_database_account_type
}