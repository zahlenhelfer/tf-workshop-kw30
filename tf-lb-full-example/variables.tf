variable "region" {
  default     = "eu-central-1"
  description = "AWS Region to use"
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

variable "sg_lb_web_config" {
  type = map(any)
  default = {
    "web access" = {
      port        = 80,
      protocol    = "tcp",
      cidr_blocks = ["0.0.0.0/0"],
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
