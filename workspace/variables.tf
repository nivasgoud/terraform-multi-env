variable instance_type {

    type = map

    default = {
        
        prod = "t3.small"
        dev = "t2.micro"

    }
}

variable subnet {

    type = string
    default = "subnet-0ac3df5627209a411"
}
