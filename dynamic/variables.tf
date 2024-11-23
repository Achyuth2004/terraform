variable "inbound_rules" {
    type = list(
        object({
            port     = number
            cidr     = list(string)
            protocol = string
        })
    )
    default = [
        {
            port     = 22
            cidr     = ["0.0.0.0/0"]
            protocol = "tcp"
        },
        {
            port     = 80
            cidr     = ["0.0.0.0/0"]
            protocol = "tcp"
        },
        {
            port     = 8080
            cidr     = ["0.0.0.0/0"]
            protocol = "tcp"
        },
        {
            port     = 3306
            cidr     = ["0.0.0.0/0"]
            protocol = "tcp"
        }
    ]
}
