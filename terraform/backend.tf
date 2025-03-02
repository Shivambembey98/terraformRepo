terraform {
  backend "s3" {
    bucket         = "statefilebackup99" # Replace with your bucket name
    key            = "calculatorAngular/terraform.tfstate"
    region         = "us-east-1"
  }
}
