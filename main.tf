terraform {
  required_version = "1.1.5"
}

data "terraform_remote_state" "vpc" {
  backend = "local"

  config = {
    path = var.remote_state_path
  }
}

module "sql_server" {
  source  = "./modules/sql_server"

  engine            = var.engine            
  engine_version    = var.engine_version    
  connection_prefix = var.connection_prefix 

  #################
  # Rds Instance
  #################
  vswitch_id    = data.terraform_remote_state.vpc.outputs.this_vswitch_ids[0][0]
  resource_group_id = data.terraform_remote_state.vpc.outputs.this_resource_group_id[0]
  instance_type = var.instance_type 
  instance_name = var.instance_name 
  storage_type = var.storage_type
  storage = var.storage
  port = var.port
  #################
  # Rds Backup policy
  #################
  preferred_backup_period     = var.preferred_backup_period
  backup_time                 = var.backup_time       
  backup_retention_period     = var.backup_retention_period     
  log_backup_retention_period = var.log_backup_retention_period 
  ###########
  #databases#
  ###########
  create_database = var.create_database
  create_account = var.create_account
  account_name = var.account_name 
  password     = var.password     
  privilege    = var.privilege    
  databases    = var.databases
  database_character = var.database_character
}