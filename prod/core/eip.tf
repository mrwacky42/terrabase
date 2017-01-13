resource "aws_eip" "eipalloc-a62edc98" {
    network_interface = "eni-5b0115a5"
    vpc               = true
}

resource "aws_eip" "eipalloc-d98a6be7" {
    network_interface = "eni-c8c5f921"
    vpc               = true
}

resource "aws_eip" "eipalloc-fcf709c2" {
    network_interface = "eni-cb04cc24"
    vpc               = true
}

resource "aws_eip" "eipalloc-5480626a" {
    network_interface = "eni-b8d20478"
    vpc               = true
}

resource "aws_eip" "eipalloc-8d9540b3" {
    instance          = "i-0d6cae1033181acb7"
    vpc               = true
}

resource "aws_eip" "eipalloc-5072ac6e" {
    vpc               = true
}

resource "aws_eip" "eipalloc-1b2edc25" {
    network_interface = "eni-696b8686"
    vpc               = true
}

resource "aws_eip" "eipalloc-3258870c" {
    instance          = "i-084950db266ec209a"
    vpc               = true
}

