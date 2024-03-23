resource "aws_security_group" "publicSG" {
  name   = "publicSG"
  vpc_id = var.vpcId

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["49.36.219.0/24"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["49.36.219.0/24"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["49.36.219.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "private_sg" {
  name        = "private_sg"
  vpc_id      = var.vpcId
  description = "allows ssh from publicSG: ${aws_security_group.publicSG.id}"
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    # cidr_blocks = ["10.0.1.0/24"]
    security_groups = [aws_security_group.publicSG.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}
