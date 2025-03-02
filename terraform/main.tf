provider "aws" {
  region = "us-east-1" # Change this to your preferred AWS region
}

resource "aws_instance" "calculatorAngular" {
  ami           = "ami-04b4f1a9cf54c11d0" # Use your existing Ubuntu AMI
  instance_type = "t2.micro"
  key_name      = "your-key" # Change to your AWS key pair name

  # Use existing security group ID instead of creating a new one
  vpc_security_group_ids = ["sg-xxxxxxxxxxxxxx"] # Replace with your actual security group ID

  tags = {
    Name = "calculatorAngular"
  }
}
