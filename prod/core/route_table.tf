resource "aws_route_table" "public" {
    vpc_id     = "vpc-24ff3c41"

    route {
        cidr_block = "10.12.0.0/16"
        gateway_id = "vgw-db20c9b2"
    }

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "igw-eb97628e"
    }

    propagating_vgws = ["vgw-db20c9b2"]

    tags {
        "Name" = "public"
    }
}

resource "aws_route_table" "private" {
    vpc_id     = "vpc-24ff3c41"

    route {
        cidr_block = "0.0.0.0/0"
    }

    propagating_vgws = ["vgw-db20c9b2"]

    tags {
        "Name" = "private"
    }
}

