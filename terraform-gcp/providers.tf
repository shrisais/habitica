// Configure the Google Cloud provider
provider "google" {
 project     = "${var.gcp_project}"
 region      = "${var.gcp_region}"
}
