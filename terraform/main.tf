provider "aws" {
  region = "us-east-1" # Change this to your preferred AWS region
}

resource "aws_security_group" "calculator_sg" {
  name        = "calculatorAngular-sg"
  description = "Security group for Angular Calculator App"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 4200
    to_port     = 4200
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "calculatorAngular" {
  ami           = "ami-04b4f1a9cf54c11d0" # Ubuntu 22.04 (Change as needed)
  instance_type = "t2.micro"
  key_name      = "your-key" # Change to your AWS key pair name

  security_groups = [aws_security_group.calculator_sg.name]

  tags = {
    Name = "calculatorAngular"
  }
}
