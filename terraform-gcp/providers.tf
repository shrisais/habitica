// Configure the Google Cloud provider
provider "google" {
 credentials = "/Users/shri/Documents/Auth/cloud-native-ci-cd-358702-de450efe196d.json"
 project     = "${var.gcp_project}"
 region      = "${var.gcp_region}"
}
