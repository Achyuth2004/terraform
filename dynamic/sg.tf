resource "aws_security_group" "allow_ports" {
    name        = "allow_ports"
    description = "Allowing ports 22, 80, 8080, 3306 access"
     
    dynamic "ingress" {
        for_each = var.inbound_rules
        content {
            from_port   = each.value.port
            to_port     = each.value.port
            protocol    = each.value.protocol
            cidr_blocks = each.value.cidr        
        }
    }

    egress {
        from_port   = 0    # Opening all ports
        to_port     = 0    
        protocol    = "-1" # Opening all protocols
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name      = "allow_ssh"
        CreatedBy = "ACHYUTH"
    }
}
