terraform {
  backend "gcs" {
    bucket  = "cloud-native-ci-cd-tf-state"
    prefix  = "terraform/state"
  }
}

