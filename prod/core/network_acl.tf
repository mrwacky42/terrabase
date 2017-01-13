# At many points along a path it is a good idea to evaluate:
#  "Do I really need to do this?"
#
# A permissive ACL, such as this one here, is available by default.
# If this ACL didn't exist, nothing would change.
# If for some reason one is still desired, it can much more easily be
# implemented using a "security_group" assigned to all hosts by default.
#
resource "aws_network_acl" "acl-4821e42d" {
    vpc_id     = "vpc-24ff3c41"
    subnet_ids = [
         "subnet-444e4f02", # subnet-main-0-20     (172.31.0.0/20)
         "subnet-65c62212", # subnet-pod1-16-20    (172.31.16.0/20)
         "subnet-6628094e", # subnet-db-32-20      (172.31.32.0/20)
         "subnet-df3a5ae5", # subnet-pod3-48-20    (172.31.48.0/20)
         "subnet-b85274f1", # misc-app-a-71        (172.31.71.0/26)
         "subnet-63046a38", # misc-app-b-71        (172.31.71.64/26)
         "subnet-7c63dd40", # misc-app-e-71        (172.31.71.128/26)
         "subnet-72feb23b", # worker-2g-a-81       (172.31.81.0/26)
         "subnet-16f5634d", # worker-2g-b-81       (172.31.81.64/26)
         "subnet-f702abcb", # worker-2g-e-81       (172.31.81.128/26)
         "subnet-48f4b801", # worker-384m-a-82     (172.31.82.0/26)
         "subnet-fefe68a5", # worker-384m-b-82     (172.31.82.64/26)
         "subnet-c207aefe", # worker-384m-e-82     (172.31.82.128/26)
         "subnet-c0f4b889", # worker-rec-a-83      (172.31.83.0/26)
         "subnet-57ff690c", # worker-rec-b-83      (172.31.83.64/26)
         "subnet-0506af39", # worker-rec-e-83      (172.31.83.128/26)
         "subnet-29de9c60", # subnet-db-core-91-24 (172.31.91.0/24)
         "subnet-6a006e31", # subnet-db-core-92-24 (172.31.92.0/24)
    ]

    ingress {
        from_port  = 0
        to_port    = 0
        rule_no    = 100
        action     = "allow"
        protocol   = "-1"
        cidr_block = "0.0.0.0/0"
    }

    egress {
        from_port  = 0
        to_port    = 0
        rule_no    = 100
        action     = "allow"
        protocol   = "-1"
        cidr_block = "0.0.0.0/0"
    }

    tags {
    }
}

