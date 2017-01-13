resource "aws_iam_server_certificate" "my-wildcard-cert" {
  name = "my-wildcard-cert-issued-on-19700101"
  certificate_body = "${file("keypairs/my_wildcard_cert_issued_by_someca_on_19700101/my-wildcard-cert.crt")}"
  certificate_chain = "${file("keypairs/my_wildcard_cert_issued_by_someca_on_19700101/my-wildcard-cert.crt-chain")}"
  private_key = "${file("keypairs/my_wildcard_cert_issued_by_someca_on_19700101/my-wildcard.key")}"
}

output "wildcard_key_arn" {
  value = "${aws_iam_server_certificate.my-wildcard-cert.arn}"
}
