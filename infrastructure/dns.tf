variable "dns_parent_zone" {}

provider "aws" {
  region = "us-east-1"
}

resource "aws_route53_record" "dns" {
  zone_id = "${data.aws_route53_zone.dns_parent.zone_id}"
  name    = "manta-ci-bridge.${data.aws_route53_zone.dns_parent.name}"
  type    = "A"
  ttl     = "300"
  records = ["${triton_machine.host.primaryip}"]
}

data "aws_route53_zone" "dns_parent" {
  name = "${var.dns_parent_zone}"
}
