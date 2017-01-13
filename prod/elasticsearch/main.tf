variable "cluster_name" { default = "test-cluster-0" }
variable "instance_count" { default = "3" }
variable "role_name" { default = "elasticsearch" }

# These should come from remote_state.core....
variable "subnets" {
    type = "list"
    default = [
        "subnet-11111111",
        "subnet-22222222",
        "subnet-33333333",
    ]
}        

#data "template_cloudinit_config" "config" {
# # https://github.com/chrusty/terraform-multipart-userdata/blob/master/example/files/cloud-config.tpl
# Things to learn about:
#   text/cloud-boothook
#
#   part {
#     filename="cloud-config"
#     content_type = "text/cloud-config"
#   }
#   part {
#     filename="script1.sh"
#     content_type = "text/x-shellscript"
#     content=""
#   }
#}
# in aws_instance:   user_data = "${data.template_cloudinit_config.config.rendered}"


##
## cloud-config YAML, per instance:
##
data "template_file" "user-data" {
    count = "${var.instance_count}"
    template = "${file("user-data.tftemplate")}"
    vars {
        instance = "${count.index}"
        role_name = "${var.role_name}"
        environment = "${var.environment}"
        cluster_name = "${var.cluster_name}"
    }
}

resource "aws_instance" "elasticsearch" {
    count = "${var.instance_count}"
    ami                         = "ami-b73b63a0"

#   availability_zone           = <computed from subnet_id>
    subnet_id                   = "${element(var.subnets, count.index)}"

    monitoring                  = false
    key_name                    = "root-user-key"
    source_dest_check           = true
    vpc_security_group_ids      = []
    iam_instance_profile        = "${aws_iam_role.elasticsearch.id}"

    # m4.* instance type settings begin
    # ebs_optimized               = true
    # instance_type               = "m4.large"
    # root_block_device {
    #     volume_type           = "gp2"
    #     volume_size           = 500
    #     delete_on_termination = true
    # }
    # m4.* instance type settings begin

    # i2.* instance settings group
    ebs_optimized               = false
    instance_type               = "i2.xlarge"
    # i2.* instance settings group end

// when done testing, uncomment to protect from accidental termination:
// disable_api_termination     = true

    tags {
        "Name" = "${var.role_name} prod ${count.index}"
        "environment" = "${var.environment}"
        "role" = "${var.role_name}"
        "instance" = "${count.index}"
    }

    user_data = "${element(data.template_file.user-data.*.rendered, count.index)}"
}

// Route53 DNS Records for instances
resource "aws_route53_record" "elasticsearch" {
  count = "${var.instance_count}"
  zone_id = "<ZONE_ID_STRING>" // ${var.environment}.example.com
  name = "${count.index}.elasticsearch.${var.environment}.example.com"
  type = "A"
  ttl = "300"
  records = ["${element(aws_instance.elasticsearch.*.private_ip,count.index)}"]
}


resource "aws_iam_instance_profile" "elasticsearch" {
    name = "${var.role_name}-${var.environment}"
    roles = [ "${aws_iam_role.elasticsearch.name}" ]
}

resource "aws_iam_role" "elasticsearch" {
    name = "${var.role_name}-${var.environment}"
    path = "/"
    # required policy, do not modify:
    assume_role_policy = "${file("../../global/iam/policies/ec2/ec2_assume_role.json")}"
}

# policy found at http://stackoverflow.com/questions/32103603/elasticsearch-cloud-aws-plugin-not-working-with-iam-role
# possibly simpler policy at:
# - https://www.elastic.co/guide/en/elasticsearch/plugins/2.0/cloud-aws-discovery.html#cloud-aws-discovery-permissions
resource "aws_iam_role_policy" "elasticsearch" {
    name = "${var.role_name}-${var.environment}"
    role = "${aws_iam_role.elasticsearch.id}"
    policy = "${file("../../global/iam/policies/ec2/ec2_describe_elastic_plugin.json")}"
}
