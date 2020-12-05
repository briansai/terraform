terraform {
  backend "s3" {
    bucket = "tf-state-12345"
    key    = "development/terraform_state"
    region = "us-west-1"
  }
}
