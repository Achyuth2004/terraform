resource "aws_instance" "expense" {
    for_each = var.instance_names
    ami = var.image_id
    vpc_security_group_ids = ["sg-0c7cc0d5a36781a1c"]
    instance_type = each.value
    tags = merge(
        var.common_tags,
        {
            Name   = each.key
            Module = each.key
        }
    )
}
