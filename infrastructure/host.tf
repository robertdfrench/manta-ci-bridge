output "host_ip" {
  value = "${triton_machine.host.primaryip}"
}

resource "triton_machine" "host" {
  name        = "manta-ci-bridge"
  package     = "g4-highcpu-512M"
  networks    = ["${data.triton_network.host.id}"]
  image       = "${data.triton_image.host.id}"
  user_script = "${file("provision.sh")}"
}

data "triton_network" "host" {
  name = "Joyent-SDC-Public"
}

data "triton_image" "host" {
  name    = "base-64"
  type    = "zone-dataset"
  os      = "smartos"
  version = "18.3.0"
}
