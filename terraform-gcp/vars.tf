variable "gcp_project" {
    default = "cloud-native-ci-cd-358702"
}

variable "gcp_region" {
    default = "us-central1-c"
}

data "template_file" "docker-script-build" {
  template = "${file("templates/docker-script-build.tpl")}"
}

data "template_file" "docker-compose-build" {
  template = "${file("templates/docker-compose-build.tpl")}"
}

data "template_file" "execute-shell" {
  template = "${file("templates/execute-shell.tpl")}"
}
