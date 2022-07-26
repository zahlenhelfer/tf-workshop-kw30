variable "region" {
  default     = "eu-central-1"
  description = "AWS Region to use"
}

variable "s3_databucket_name" {
  default = "mro-zh-42"
}

variable "static_bucket_name" {
  default = "mro-website-42"
}

variable "database_needed" {
  type        = bool
  default     = false
  description = "(optional) describe your variable"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "The aws instance-type (eg. t2.micro)"
}

variable "node_count" {
  type        = number
  default     = 2
  description = "Number of Instances"
}

variable "image_id" {
  type        = string
  default     = "ami-0a1ee2fb28fe05df3"
  description = "The id of the machine image (AMI) to use for the server."
  validation {
    # regex(...) fails if it cannot find a match
    condition     = can(regex("^ami-", var.image_id))
    error_message = "Image-id value must be a valid ami id, does it start with 'ami-'?"
  }
}

variable "ami_id" {
  type = map(string)
  default = {
    eu-central-1 = "ami-0a1ee2fb28fe05df3"
    us-west-2    = "ami-098e42ae54c764c35"
  }
}

variable "sg_web_config" {
  type = map(any)
  default = {
    "web access" = {
      port        = 80,
      protocol    = "tcp",
      cidr_blocks = ["0.0.0.0/0"],
    }
    "ssh access" = {
      port        = 22,
      protocol    = "tcp",
      cidr_blocks = ["10.0.0.0/16"],
    }
  }
}

variable "common_tags" {
  type = map(string)
  default = {
    Department  = "Global Infrastructure Services"
    Team        = "EMEA Delivery"
    CostCenter  = "666"
    Application = "Terraform Demo App"
  }
}
