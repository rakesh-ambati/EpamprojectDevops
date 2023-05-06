provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "web" {
  name_prefix = "web-"
  
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "jenkins" {
  ami = "ami-0c94855ba95c71c99"
  instance_type = "t2.micro"
  tags = {
    Name = "jenkins"
  }
  security_groups = [sg-023b9bb7a20dfe54b]
}

resource "aws_instance" "ansible" {
  ami = "ami-0c94855ba95c71c99"
  instance_type = "t2.micro"
  tags = {
    Name = "ansible"
  }
  security_groups = [sg-023b9bb7a20dfe54b]
}

resource "aws_instance" "docker" {
  ami = "ami-0c94855ba95c71c99"
  instance_type = "t2.micro"
  tags = {
    Name = "docker"
  }
  security_groups = [sg-023b9bb7a20dfe54b]
}
