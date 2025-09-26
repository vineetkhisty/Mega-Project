variable "env" {
  description = "The environment for the resources"
  type = string

}

variable "bucket_name" {
    description = "The name of the S3 bucket"
    type = string
}

variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  
}

variable "hash_key" {
  description = "The hash key for the DynamoDB table"
  type        = string
  
}

