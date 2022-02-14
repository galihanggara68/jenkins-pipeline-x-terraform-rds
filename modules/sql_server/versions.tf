terraform {
  required_version = "1.1.5"
  required_providers {
	alicloud = {
		source  = "aliyun/alicloud"
		version = ">= 1.151.0"
	}
  }
}