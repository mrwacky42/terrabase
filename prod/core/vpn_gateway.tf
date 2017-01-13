resource "aws_vpn_gateway" "aws-vpn-gateway" {
    vpc_id = "vpc-24ff3c41"
    availability_zone = ""
    tags {
        "Name" = "aws-vpn-gateway"
    }
}

