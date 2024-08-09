# In Terraform loops concept would work with the for_each keyword which contains keys and values key = value i.e to call those values we define as each.key and each.value

resource "aws_instance" "roboproject" {
    for_each = var.name
    ami = data.aws_ami.robo-id.id   #Public Image DevOps-Practice
    instance_type = each.value
    subnet_id = var.subnet
    associate_public_ip_address = true
    #vpc_security_group_ids = [aws_security_group.roboshop-all.id]

    tags = {
        
        Name = each.key
    }
}


#Route 53 records

resource "aws_route53_record" "roboshop53" {
  #count = 11   #count is a special variable given by terraform for looping
  #count = length(var.name)
  for_each = aws_instance.roboproject
  zone_id = var.zoneid
  name    = "${each.key}.${var.domain-name}"    #interpolation
  type    = "A"
  ttl     = 1
#   records = [each.key == "web" ? aws_instance.roboproject[each.key].public_ip : aws_instance.roboproject[each.key].private_ip]
  records = [startswith(each.key, "web") ? each.value.public_ip : each.value.private_ip]
}