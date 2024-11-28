resource "aws_instance" "myec2" {
    ami           = "ami-0942ecd5d85baa812"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.subnet1.id
    key_name = "docker"
    vpc_security_group_ids = [aws_security_group.mysg.id]
    associate_public_ip_address = true
    tags = {
        Name = "LinuxWebServer"
    }  
}