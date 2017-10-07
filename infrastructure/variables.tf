variable "region" { }
variable "availability_zones" { type = "list" }

variable "domain" { default = "example.com" }

variable "container_php_mem" {
  description = "Memory limit for php container"
  default     = 256
}
