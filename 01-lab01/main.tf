resource "aws_instance" "wordpress" {
  ami           = "ami-0bf5d5d5c92a17e24"
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.wordpress.id]

  user_data                   = file("${path.module}/cloud-init.sh")
  user_data_replace_on_change = true

  tags = {
    Name = "wordpress"
  }
}

resource "aws_security_group" "wordpress" {
  name        = "wordpress-sg"
  description = "Allow HTTP traffic to WordPress instance"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["38.126.87.104/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "wordpress-sg"
  }
}