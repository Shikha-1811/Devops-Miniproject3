resource "aws_security_group" "miniproject_sg" {
  name        = "miniproject-sg"
  description = "Security group for miniproject"

  tags = {
    Name = "miniproject-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh_from_my_ip" {
  security_group_id = aws_security_group.miniproject_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.miniproject_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.miniproject_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound_ipv6" {
  security_group_id = aws_security_group.miniproject_sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1"
}
