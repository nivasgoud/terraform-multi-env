# In Terraform loops concept would work with the for_each keyword which contains keys and values key = value i.e to call those values we define as each.key and each.value

resource "aws_instance" "roboproject" {  
    ami = data.aws_ami.robo-id.id   #Public Image DevOps-Practice
    instance_type = lookup(var.instance_type, terraform.workspace)
    subnet_id = var.subnet
    associate_public_ip_address = true
    #vpc_security_group_ids = [aws_security_group.roboshop-all.id]

    tags = {
        
        Name = terraform.workspace
    }
}

