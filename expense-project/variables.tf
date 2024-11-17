#ec2 variables
variable "instance_names" {
    type = list
    default = ["db","backend","frontend"]   
}
variable "image_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
    description = "RHEL-9 AWS ID"    
}

variable "instance_type" {
    default = "t3.micro"
    type = string   
}

variable "common_tags" {
    default = {
        project = "Expense" 
        Environment ="Dev"
        Terraform ="true"
    }
      
}

#sg variables
variable "sg_name" {
    default = "allow_ssh"  
}

variable "sg_description"{
    default="allowing port 22"
}
variable "ssh_port" {
    default = 22
}
variable "protocol" {
    default = "tcp"  
}

