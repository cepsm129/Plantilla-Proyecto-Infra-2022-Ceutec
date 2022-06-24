resource "aws_launch_template" "foo" {
name = "LT-PROYECTO-CARLOS"
description = "Template creado para proyecto"
image_id = "ami-0022f774911c1d690"
instance_type = "t2.micro"
tags = {
  "ESTUDIANTE" = "CARLOS"
  "NAME" = "CARLOS"
}
key_name = "Llave-Carlos"
vpc_security_group_ids = ["sg-0176a246dcc70dedd"]
user_data = "${filebase64("userdata.sh")}"
}
resource "aws_autoscaling_group" "bar" {
name = "AG-PROYECTO-CARLOS"
availability_zones = ["us-east-1a"]
desired_capacity = 1
max_size = 4
min_size = 1

launch_template {
id = aws_launch_template.foo.id
version = "$Latest"
}
tag {
key = "Name"
value = "PROYECTO-CARLOS"
propagate_at_launch = true
}
}