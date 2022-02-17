data "alicloud_db_instance_classes" "default" {
  count          = var.engine == "PostgreSQL" ? 1 : 0
  engine         = var.engine
  engine_version = var.engine_version
  category       = "Basic"
  storage_type   = "cloud_efficiency"
}

resource "alicloud_db_instance" "instance" {
  engine           = var.engine
  engine_version   = var.engine_version
  instance_name    = var.instance_name
  instance_type    = var.instance_type
  instance_storage = var.storage
  vswitch_id       = var.vswitch_id
}

resource "alicloud_db_database" "db" {
  count         = var.create_database ? length(var.databases) : 0
  instance_id   = alicloud_db_instance.instance.id
  name          = lookup(var.databases[count.index], "name")
  character_set = lookup(var.databases[count.index], "character_set")
  description   = lookup(var.databases[count.index], "description")
}

resource "alicloud_db_account" "account" {
  instance_id = alicloud_db_instance.instance.id
  name        = var.account_name
  password    = var.password
}

resource "alicloud_db_account_privilege" "privilege" {
  instance_id  = alicloud_db_instance.instance.id
  account_name = alicloud_db_account.account.name
  db_names     = alicloud_db_database.db.*.name
  privilege    = var.privilege
}

resource "alicloud_db_backup_policy" "backup" {
  instance_id   = alicloud_db_instance.instance.id
  backup_period = var.preferred_backup_period
  backup_time   = var.backup_time
  backup_retention_period = var.backup_retention_period
  log_backup_retention_period = var.log_backup_retention_period
}

resource "alicloud_db_connection" "connection" {
  instance_id       = alicloud_db_instance.instance.id
  connection_prefix = var.connection_prefix
}

