provider "aws" {
  region = "${var.aws_region}"
}

terraform {
  required_version = ">= 0.9.3, != 0.9.5"
}

data "aws_ami" "consul" {
  most_recent = true

  # If we change the AWS Account in which test are run, update this value.
  owners = ["562637147889"]

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "is-public"
    values = ["true"]
  }

  filter {
    name   = "name"
    values = ["consul-ubuntu-*"]
  }
}


module "create-single-app" {

  source = "../consul-cluster"

  user_data = "${data.template_file.user_data_client.rendered}"

}


data "template_file" "user_data_client" {
  template = "${file("../../examples/root-example/rule-install.sh")}"

  vars {
    cluster_tag_key   = "${var.cluster_tag_key}"
    cluster_tag_value = "${var.cluster_name}"
  }
}