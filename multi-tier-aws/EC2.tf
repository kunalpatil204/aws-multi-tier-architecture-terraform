#Template for EC2 
resource "aws_launch_template" "app_lt" {
  name_prefix   = "app-lt-"
  image_id      = "ami-0f5ee92e2d63afc18" # Amazon Linux (ap-south-1)
  instance_type = "t3.micro"
  key_name      = "MTA_key"

  network_interfaces {
    associate_public_ip_address = false
    security_groups  = [aws_security_group.ec2_sg.id]
  }

  user_data = base64encode(<<-EOF
              #!/bin/bash
              yum update -y
              yum install nginx -y
              systemctl start nginx
              systemctl enable nginx
              EOF
  )

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "app-instance"
    }
  }
}