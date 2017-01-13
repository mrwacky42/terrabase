# https://aws.amazon.com/blogs/aws/new-vpc-endpoint-for-amazon-s3/
resource "aws_vpc_endpoint" "private-s3" {
    vpc_id = "vpc-24ff3c41"
    service_name = "com.amazonaws.us-east-1.s3"
    route_table_ids = [
        "rtb-3b0cca5e", # public
        "rtb-1e1c1478", # private
    ]
    policy = <<POLICY
{
    "Statement": [
        {
            "Action": "*",
            "Effect": "Allow",
            "Resource": "*",
            "Principal": "*"
        }
    ],
    "Version": "2008-10-17"
}
POLICY

}
