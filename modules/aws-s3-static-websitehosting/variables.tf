variable "website-bucket-name" {
  type = string
}

variable "enable-versioning" {
  type    = bool
  default = false
}

variable "tags" {
  type    = map(string)
  default = {}
}
