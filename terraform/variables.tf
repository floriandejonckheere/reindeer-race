##
# Providers
#
variable "hcloud_token" {
  type = string
}

variable "gandi_key" {
  type = string
}

##
# Services
#
variable "passwd" {
  description = "UNIX password hash for cloud user"
  type = string
}

##
# DNS
#
variable "domain_contact" {
  description = "Domain contact"
  type = map(string)
}
