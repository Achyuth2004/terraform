#resource <resource-type>    <resource-name>

resource "aws_instance" "db" {
    count = length(var.instance_names)
    ami= var.image_id
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    instance_type = var.instance_names[count.index] == "db" ? "t3.small":"t3.micro"
    tags= merge(var.common_tags,
      {
        Name= var.instance_names[count.index]
        Module= var.instance_names[count.index]
      } )
}

resource "aws_security_group" "allow_ssh" {
    name = var.sg_name
    description = var.sg_description
    #  this is block
    ingress {
        from_port        = var.ssh_port
        to_port          = var.ssh_port
        protocol         = var.protocol
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

