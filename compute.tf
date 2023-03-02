resource "aws_network_interface" "bastion-eth0" {
  description = "pc01-port1"
  subnet_id   = aws_subnet.pcsubnetaz1.id
  associate_public_ip_address = "true"
}

resource "aws_network_interface" "pc01-eth0" {
  description = "pc01-port1"
  subnet_id   = aws_subnet.pcsubnetaz1.id
}

resource "aws_instance" "bastion" {
    ami = "ami-065793e81b1869261"
    instance_type = "t3.xlarge"
    key_name          = var.keyname
    availability_zone = var.az1

  network_interface {
    network_interface_id = aws_network_interface.bastion-eth0.id
    device_index         = 0
  }
}

resource "aws_instance" "pc01" {
    ami = "ami-0acafadf3f00e9c70"
    instance_type = "t3.xlarge"
    key_name          = var.keyname
    availability_zone = var.az1

  network_interface {
    network_interface_id = aws_network_interface.pc01-eth0.id
    device_index         = 0
  }
}