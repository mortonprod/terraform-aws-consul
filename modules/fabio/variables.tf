variable "cluster_tag_key" {
  description = "The tag the EC2 Instances will look for to automatically discover each other and form a cluster."
  default     = "consul-servers"
}

variable "vpc_id" {
  default = "vpc-f64b7c9f"
}

variable "cluster_name" {
  description = "What to name the Consul cluster and all of its associated resources"
  default     = "consul-example"
}

variable "aws_region" {
  description = "The AWS region to deploy into (e.g. eu-west-2)."
  default     = "eu-west-2"
}

variable "public_key_path" {
  default = "~/.ssh/myKey.pub"
}

variable "key_name" {
  default = "myKey"
}

# Ubuntu Precise 14.04 LTS (x64)
variable "aws_amis" {
  default = "ami-74243a10"
}