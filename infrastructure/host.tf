output "host_ip" {
  value = "${triton_machine.host.primaryip}"
}

resource "triton_machine" "host" {
  name        = "manta-ci-bridge"
  package     = "g4-highcpu-512M"
  networks    = ["${data.triton_network.host.id}"]
  image       = "${var.host_image_id}"
  user_script = "${file("provision.sh")}"
}

data "triton_network" "host" {
  name = "Joyent-SDC-Public"
}

variable "host_image_id" {}
