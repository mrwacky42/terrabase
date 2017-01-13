# When adding a subnet here, please also add it to the aws_network_acl in network_acl.tf

resource "aws_subnet" "subnet-0506af39-worker-rec-e" {
    vpc_id                  = "vpc-24ff3c41"
    cidr_block              = "172.31.83.128/26"
    availability_zone       = "us-east-1e"
    map_public_ip_on_launch = false

    tags {
        "Name" = "worker-rec-e-83"
    }
}

resource "aws_subnet" "subnet-16f5634d-worker-2g-b" {
    vpc_id                  = "vpc-24ff3c41"
    cidr_block              = "172.31.81.64/26"
    availability_zone       = "us-east-1b"
    map_public_ip_on_launch = false

    tags {
        "Name" = "worker-2g-b-81"
    }
}

resource "aws_subnet" "subnet-df3a5ae5-subnet-pod3" {
    vpc_id                  = "vpc-24ff3c41"
    cidr_block              = "172.31.48.0/20"
    availability_zone       = "us-east-1e"
    map_public_ip_on_launch = true

    tags {
        "Name" = "subnet-pod3-48-20"
    }
}

resource "aws_subnet" "subnet-57ff690c-worker-rec-b" {
    vpc_id                  = "vpc-24ff3c41"
    cidr_block              = "172.31.83.64/26"
    availability_zone       = "us-east-1b"
    map_public_ip_on_launch = false

    tags {
        "Name" = "worker-rec-b-83"
    }
}

resource "aws_subnet" "subnet-c0f4b889-worker-rec-a" {
    vpc_id                  = "vpc-24ff3c41"
    cidr_block              = "172.31.83.0/26"
    availability_zone       = "us-east-1a"
    map_public_ip_on_launch = false

    tags {
        "Name" = "worker-rec-a-83"
    }
}

resource "aws_subnet" "subnet-444e4f02-subnet-main" {
    vpc_id                  = "vpc-24ff3c41"
    cidr_block              = "172.31.0.0/20"
    availability_zone       = "us-east-1b"
    map_public_ip_on_launch = true

    tags {
        "Name" = "subnet-main-0-20"
    }
}

resource "aws_subnet" "subnet-6628094e-subnet-db" {
    vpc_id                  = "vpc-24ff3c41"
    cidr_block              = "172.31.32.0/20"
    availability_zone       = "us-east-1d"
    map_public_ip_on_launch = true

    tags {
        "Name" = "subnet-db-32-20"
    }
}

resource "aws_subnet" "subnet-c207aefe-worker-384m-e" {
    vpc_id                  = "vpc-24ff3c41"
    cidr_block              = "172.31.82.128/26"
    availability_zone       = "us-east-1e"
    map_public_ip_on_launch = false

    tags {
        "Name" = "worker-384m-e-82"
    }
}

resource "aws_subnet" "subnet-f702abcb-worker-2g-e" {
    vpc_id                  = "vpc-24ff3c41"
    cidr_block              = "172.31.81.128/26"
    availability_zone       = "us-east-1e"
    map_public_ip_on_launch = false

    tags {
        "Name" = "worker-2g-e-81"
    }
}

resource "aws_subnet" "subnet-fefe68a5-worker-384m-b" {
    vpc_id                  = "vpc-24ff3c41"
    cidr_block              = "172.31.82.64/26"
    availability_zone       = "us-east-1b"
    map_public_ip_on_launch = false

    tags {
        "Name" = "worker-384m-b-82"
    }
}

resource "aws_subnet" "subnet-29de9c60-subnet-db-core" {
    vpc_id                  = "vpc-24ff3c41"
    cidr_block              = "172.31.91.0/24"
    availability_zone       = "us-east-1a"
    map_public_ip_on_launch = false

    tags {
        "Name" = "subnet-db-core-91-24"
    }
}

resource "aws_subnet" "subnet-65c62212-subnet-pod1" {
    vpc_id                  = "vpc-24ff3c41"
    cidr_block              = "172.31.16.0/20"
    availability_zone       = "us-east-1a"
    map_public_ip_on_launch = true

    tags {
        "Name" = "subnet-pod1-16-20"
    }
}

resource "aws_subnet" "subnet-48f4b801-worker-384m-a" {
    vpc_id                  = "vpc-24ff3c41"
    cidr_block              = "172.31.82.0/26"
    availability_zone       = "us-east-1a"
    map_public_ip_on_launch = false

    tags {
        "Name" = "worker-384m-a-82"
    }
}

resource "aws_subnet" "subnet-72feb23b-worker-2g-a" {
    vpc_id                  = "vpc-24ff3c41"
    cidr_block              = "172.31.81.0/26"
    availability_zone       = "us-east-1a"
    map_public_ip_on_launch = false

    tags {
        "Name" = "worker-2g-a-81"
    }
}

# recent additions
resource "aws_subnet" "subnet-b85274f1-misc-app-a-71" {
    vpc_id                  = "vpc-24ff3c41"
    cidr_block              = "172.31.71.0/26"
    availability_zone       = "us-east-1a"
    map_public_ip_on_launch = false

    tags {
        "Name" = "misc-app-a-71"
    }
}

resource "aws_subnet" "subnet-63046a38-misc-app-b-71" {
    vpc_id                  = "vpc-24ff3c41"
    cidr_block              = "172.31.71.64/26"
    availability_zone       = "us-east-1b"
    map_public_ip_on_launch = false

    tags {
        "Name" = "misc-app-b-71"
    }
}

resource "aws_subnet" "subnet-7c63dd40-misc-app-e-71" {
    vpc_id                  = "vpc-24ff3c41"
    cidr_block              = "172.31.71.128/26"
    availability_zone       = "us-east-1e"
    map_public_ip_on_launch = false

    tags {
        "Name" = "misc-app-e-71"
    }
}
