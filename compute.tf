resource "aws_instance" "bastion" {
    ami                         = "ami-017661010558cc954"
    instance_type               = var.size
    key_name                    = var.keyname
    availability_zone           = var.az1
    associate_public_ip_address = "true"
    subnet_id                   = aws_subnet.bastionsubnetaz1.id
    vpc_security_group_ids      = ["${aws_security_group.bastion.id}"]
    iam_instance_profile        = "EC2_to_SSM"

  tags = {
    Name = "BastionServer"
  }
}

resource "aws_instance" "pc01" {
    ami                         = "ami-0acafadf3f00e9c70"
    instance_type               = var.size
    key_name                    = var.keyname
    availability_zone           = var.az1
    associate_public_ip_address = "false"
    subnet_id                   = aws_subnet.pcsubnetaz1.id
    vpc_security_group_ids      = ["${aws_security_group.pc.id}"]

  tags = {
    Name = "Windows10"
  }
}

resource "aws_security_group" "bastion" {
  name        = "bastion-sg"
  description = "Bastion Security Group"
  vpc_id      = aws_vpc.fgtvm-vpc.id
  ingress {
    from_port   = 3389
    to_port     = 3389
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

resource "aws_security_group" "pc" {
  name        = "pc-sg"
  description = "PC Security Group"
  vpc_id      = aws_vpc.fgtvm-vpc.id
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    #cidr_blocks = var.vpccidr
    cidr_blocks = ["${var.vpccidr}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  } 
}