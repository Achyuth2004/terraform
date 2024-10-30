#resource <resource-type>    <resource-name>

resource "aws_instance" "db" {
    ami= var.image_id
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    instance_type = var.instance_type
    tags= var.tags 
}

resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "allowing ssh"
     
    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    egress {
        from_port        = 0    #opening all ports
        to_port          = 0    
        protocol         = "-1" #opening all protocols
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_ssh"
        CreatedBy = "ACHYUTH"
    }
}

