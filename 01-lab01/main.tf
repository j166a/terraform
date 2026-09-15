resource "aws_instance" "wordpress" {
  ami           = "ami-0bf5d5d5c92a17e24"
  instance_type = var.instance_type

  tags = {
    Name = "WordPressInstance"
  }
}

