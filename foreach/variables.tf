variable "instance_names" {
    type = map(string)
    default = {
        db       = "t3.small"
        backend  = "t3.micro"
        frontend = "t3.micro"
    }
}

variable "image_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
}

variable "common_tags" {
    type = map(string)
    default = {
        project     = "Expense"
        Environment = "Dev"
        Terraform   = "true"
    }
}
