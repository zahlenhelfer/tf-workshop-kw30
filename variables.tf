variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "The aws instance-type (eg. t2.micro)"
}

variable "node_count" {
  type        = number
  default     = 3
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
