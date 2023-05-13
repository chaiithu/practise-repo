provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web" {
  ami             = "ami-0b08bfc6ff7069aff"
  instance_type   = "t2.micro"
  key_name        = "new.key"
  security_groups = ["launch-wizard-1"]
  count           = 1
  tags = merge(
    {
      Name = element(var.name, count.index)
    },
    var.tags
  )
}

