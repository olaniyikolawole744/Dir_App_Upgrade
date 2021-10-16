output "ec2_instance_ip" {
    value = aws_instance.web.public_ip
}

/*output vpc_id2{
    value = aws_vpc.exp_vpc.id
}

output security_group_id{
    value = aws_security_group.sg_template.id
}

output subnet_parameters{
    value = aws_subnet.public_subnet.id
}*/

