terraform {
  experiments = [variable_validation]
}

variable "GCP_PROJECT_NAME" {
	type = string
	default = "ixvm-261016"
}

variable "GCP_REGION_NAME" {
	type = string
	default = "us-central1"
}

variable "GCP_ZONE_NAME" {
	type = string
	default = "us-central1-a"
}

variable "GCP_OWNER_TAG" {
	type = string
	default = "gcp-ixload@google.com"
}

variable "GCP_LOGIN_ID_TAG" {
	type = string
	default = "gcp-ixload"
}

variable "GCP_PROJECT_TAG" {
	type = string
	default = "open-ixia-gcp-ixload"
}

variable "GCP_VMONE_MACHINE_TYPE" {
	type = string
	default = "c2-standard-8"
	validation {
		condition = can(regex("c2-standard-16", var.GCP_VMONE_MACHINE_TYPE)) || can(regex("c2-standard-8", var.GCP_VMONE_MACHINE_TYPE)) || can(regex("c2-standard-4", var.GCP_VMONE_MACHINE_TYPE))
		error_message = "GCP_VMONE_MACHINE_TYPE must be one of (c2-standard-16 | c2-standard-8 | c2-standard-4) types."
	}
}