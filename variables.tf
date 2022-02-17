variable "remote_state_path" {
  default = ""
}

variable "engine" {
  default = "SQLServer"
}

variable "engine_version" {
  default = "2016_std_ha"
}

variable "storage" {
  default = 50
}

variable "storage_type" {
  default = "local_ssd"
}

variable "instance_type" {
  default = "mssql.x4.medium.s2"
}

variable "instance_name" {
  default = "test-sql-server-instance"
}

variable "connection_prefix" {
  default = "tf-rds"
}

variable "account_name" {
  default = "tf_tester"
}

variable "password" {
  default = "Test12345"
}

variable "privilege" {
  default = "ReadWrite"
}

variable "create_database" {
  default = true
}

variable "create_account" {
  default = true
}

variable "databases" {
  default = []
}

variable "database_character" {
  default = "utf8"
}

variable "vswitch_id" {
  description = "The vpc id used to launch vswitch, security group and instance."
  default     = -1
}

variable "preferred_backup_period" {
  default = ["Monday","Tuesday"]
}

variable "backup_time" {
  default = "00:00Z-01:00Z"
}

variable "backup_retention_period" {
  default = 7
}

variable "log_backup_retention_period" {
  default = 1
}