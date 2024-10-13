variable "region" {
  type        = string
  description = "The region for subnet"
}

variable "subnetwork_name" {
  type        = string
  description = "The name of the subnetwork"
}

variable "vpc_name" {
  type        = string
  description = "The name of the VPC network"
}

variable "project_id" {
  type        = string
  description = "GCP project id"
}

variable "subnet_cidr" {
  type        = string
  description = "CIDR range for subnet"
}

variable "tfstate_bucket_name" {
  type        = string
  description = "The name of the bucket to store the terraform state file"
}

variable "zone" {
  type        = string
  description = "GCP zone for vm"
}

variable "vm_machine_type" {
  type        = string
  description = "machine type for vm"
}
variable "prefix" {
  type    = string
  default = "main"
}
