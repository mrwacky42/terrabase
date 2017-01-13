resource "aws_customer_gateway" "aws-joyent-us-east" {
  bgp_asn = "65000"
  ip_address = "8.12.41.196"
  tags = {
    Name = "aws-joyent-us-east"
  }
  type = "ipsec.1"
}

resource "aws_customer_gateway" "aws-joyent-poc" {
  bgp_asn = "65000"
  ip_address = "165.225.151.34"
  tags = {
    Name = "aws-joyent-poc"
  }
  type = "ipsec.1"
}

resource "aws_customer_gateway" "aws-joyent-core" {
  bgp_asn = "65000"
  ip_address = "165.225.151.239"
  tags = {
    Name = "aws-joyent-core"
  }
  type = "ipsec.1"
}
