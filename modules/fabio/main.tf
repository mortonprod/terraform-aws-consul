# Specify the provider and access details
provider "aws" {
  region = "${var.aws_region}"
}

module "create-fabio" {

  source = "../consul-cluster"
  cluster_name = "consul-example-client"
  user_data = "${data.template_file.user_data_client.rendered}"

}


data "template_file" "user_data_client" {
  template = "${file("../../examples/root-example/fabio-install.sh")}"

  vars {
    cluster_tag_key   = "${var.cluster_tag_key}"
    cluster_tag_value = "${var.cluster_name}"
  }
}







