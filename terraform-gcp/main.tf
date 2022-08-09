// Terraform plugin for creating random ids
// https://cloud.google.com/community/tutorials/getting-started-on-gcp-with-terraform
resource "random_id" "instance_id" {
 byte_length = 8
}

// A single Google Cloud Engine instance
resource "google_compute_instance" "default" {
 name         = "gcp-cloud-${random_id.instance_id.hex}"
 machine_type = "n1-standard-1"
 zone         = "${var.gcp_region}"
 tags         = ["http"]

 boot_disk {
   initialize_params {
     image = "debian-cloud/debian-10"
     size = "75"
   }
 }

 metadata = {
  startup-script = <<SCRIPT
  ${data.template_file.docker-script-build.rendered}
  ${data.template_file.docker-compose-build.rendered}
  ${data.template_file.execute-shell.rendered}
  SCRIPT
 }

 network_interface {
   network = "default"

   access_config {
     // Include this section to give the VM an external ip address

   }
 }
}
