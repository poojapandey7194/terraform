resource "aws_instance" "myec2" {
    ami           = "ami-0942ecd5d85baa812"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.subnet1.id
    key_name = "docker"
    vpc_security_group_ids = [aws_security_group.mysg.id]
    associate_public_ip_address = true
    user_data = <<EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y httpd
    sudo systemctl start httpd
    sudo systemctl enable httpd
    echo "<h1> Welcome to terraform class and this EC2 instance got created</h1>" > /var/www/html/index.html
    EOF
    tags = {
        Name = "LinuxWebServer"
    }  
}