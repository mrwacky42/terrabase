resource "aws_security_group" "vpc-24ff3c41-default" {
    name        = "default"
    description = "default VPC security group"
    vpc_id      = "vpc-24ff3c41"

    ingress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["165.225.151.34/32", "10.100.0.0/16", "10.12.0.0/16", "67.203.172.154/32", "172.31.0.0/16", "165.225.151.239/32", "10.100.40.0/23", "8.12.41.196/32"]
        security_groups = []
        self            = true
    }

    ingress {
        from_port       = 4500
        to_port         = 4500
        protocol        = "udp"
        cidr_blocks     = ["52.203.100.218/32"]
    }

    ingress {
        from_port       = 500
        to_port         = 500
        protocol        = "udp"
        cidr_blocks     = ["52.203.100.218/32"]
    }

    ingress {
        from_port       = -1
        to_port         = -1
        protocol        = "icmp"
        cidr_blocks     = ["165.225.151.34/32", "165.225.151.239/32"]
    }


    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

}

resource "aws_security_group" "vpc-24ff3c41-launch-wizard-1" {
    name        = "launch-wizard-1"
    description = "launch-wizard-1 created 2015-07-07T22:19:23.688-07:00"
    vpc_id      = "vpc-24ff3c41"

    ingress {
        from_port       = 22
        to_port         = 22
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }


    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

}

resource "aws_security_group" "vpc-24ff3c41-launch-wizard-2" {
    name        = "launch-wizard-2"
    description = "launch-wizard-2 created 2016-12-29T20:23:25.146-08:00"
    vpc_id      = "vpc-24ff3c41"

    ingress {
        from_port       = 22
        to_port         = 22
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }


    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

}

resource "aws_security_group" "vpc-24ff3c41-launch-wizard-3" {
    name        = "launch-wizard-3"
    description = "launch-wizard-3 created 2016-12-29T20:47:49.262-08:00"
    vpc_id      = "vpc-24ff3c41"

    ingress {
        from_port       = 22
        to_port         = 22
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }


    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

}

resource "aws_security_group" "vpc-24ff3c41-prod-app" {
    name        = "prod-app"
    description = "Production Application Layer SG"
    vpc_id      = "vpc-24ff3c41"

    ingress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["165.225.151.34/32", "10.100.0.0/16", "10.12.0.0/16", "67.203.172.154/32", "172.31.0.0/16", "165.225.151.239/32", "10.100.40.0/23"]
        security_groups = ["sg-08f8786d"]
        self            = true
    }

    ingress {
        from_port       = 4500
        to_port         = 4500
        protocol        = "udp"
        cidr_blocks     = ["52.203.100.218/32"]
    }

    ingress {
        from_port       = 500
        to_port         = 500
        protocol        = "udp"
        cidr_blocks     = ["52.203.100.218/32"]
    }

    ingress {
        from_port       = -1
        to_port         = -1
        protocol        = "icmp"
        cidr_blocks     = ["165.225.151.34/32", "165.225.151.239/32"]
    }


    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    tags {
        "Name" = "prod-app"
    }
}

resource "aws_security_group" "vpc-24ff3c41-prod-db" {
    name        = "prod-db"
    description = "Production Backend SG"
    vpc_id      = "vpc-24ff3c41"

    ingress {
        from_port       = 5432
        to_port         = 5432
        protocol        = "tcp"
        cidr_blocks     = ["10.100.0.0/16", "172.31.0.0/16"]
    }

    ingress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["165.225.151.34/32", "10.100.0.0/16", "10.12.0.0/16", "67.203.172.154/32", "172.31.0.0/16", "165.225.151.239/32", "10.100.40.0/23"]
        security_groups = ["sg-08f8786d"]
        self            = true
    }

    ingress {
        from_port       = 4500
        to_port         = 4500
        protocol        = "udp"
        cidr_blocks     = ["52.203.100.218/32"]
    }

    ingress {
        from_port       = 500
        to_port         = 500
        protocol        = "udp"
        cidr_blocks     = ["52.203.100.218/32"]
    }

    ingress {
        from_port       = 3306
        to_port         = 3306
        protocol        = "tcp"
        cidr_blocks     = ["172.31.0.0/16"]
    }

    ingress {
        from_port       = -1
        to_port         = -1
        protocol        = "icmp"
        cidr_blocks     = ["165.225.151.34/32", "165.225.151.239/32"]
    }


    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    tags {
        "Name" = "prod-db"
    }
}

resource "aws_security_group" "vpc-24ff3c41-prod-mgmt" {
    name        = "prod-mgmt"
    description = "Production Management SG"
    vpc_id      = "vpc-24ff3c41"

    ingress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["165.225.151.34/32", "10.100.0.0/16", "10.12.0.0/16", "67.203.172.154/32", "172.31.0.0/16", "165.225.151.239/32", "10.100.40.0/23", "8.12.41.196/32", "23.240.0.65/32", "45.48.248.211/32"]
        security_groups = ["sg-08f8786d", "sg-4b155b36", "sg-92145aef", "sg-f9155b84"]
        self            = true
    }

    ingress {
        from_port       = 4440
        to_port         = 4440
        protocol        = "tcp"
        cidr_blocks     = ["67.203.172.154/32"]
    }

    ingress {
        from_port       = 4500
        to_port         = 4500
        protocol        = "udp"
        cidr_blocks     = ["34.194.129.223/32", "52.203.100.218/32"]
    }

    ingress {
        from_port       = 500
        to_port         = 500
        protocol        = "udp"
        cidr_blocks     = ["34.194.129.223/32", "52.203.100.218/32"]
    }

    ingress {
        from_port       = -1
        to_port         = -1
        protocol        = "icmp"
        cidr_blocks     = ["165.225.151.34/32", "165.225.151.239/32", "8.12.41.196/32"]
    }


    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    tags {
        "Name" = "prod-mgmt"
    }
}

resource "aws_security_group" "vpc-24ff3c41-prod-web" {
    name        = "prod-web"
    description = "Production Frontend SG"
    vpc_id      = "vpc-24ff3c41"

    ingress {
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    ingress {
        from_port       = 0
        to_port         = 65535
        protocol        = "tcp"
        cidr_blocks     = ["68.101.112.143/32"]
    }

    ingress {
        from_port       = 8080
        to_port         = 8080
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    ingress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["67.203.172.154/32"]
        security_groups = ["sg-08f8786d"]
        self            = true
    }

    ingress {
        from_port       = 443
        to_port         = 443
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }


    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    tags {
        "Name" = "prod-web"
    }
}

resource "aws_security_group" "vpc-24ff3c41-vpn" {
    name        = "vpn"
    description = "vpn"
    vpc_id      = "vpc-24ff3c41"

    ingress {
        from_port       = 1194
        to_port         = 1194
        protocol        = "udp"
        cidr_blocks     = ["0.0.0.0/0"]
    }


    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    tags {
        "Name" = "vpn"
    }
}


resource "aws_security_group" "smtp" {
    name        = "smtp-inbound"
    description = "allow inbound smtp on tcp/25"
    vpc_id      = "vpc-24ff3c41"

    ingress {
        from_port       = 0
        to_port         = 25
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    tags {
        "Name" = "smtp"
    }
}

