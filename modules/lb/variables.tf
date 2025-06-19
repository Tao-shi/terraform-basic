variable "default_subnet" {
  type = list(string)
}

variable "security_group_ids" {
  type = list(string)
}

variable "default_vpc_id" {
  type = string
}

variable "webserver_id" {
  type = list(string)
}