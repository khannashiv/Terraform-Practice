resource "aws_lb" "ALB" {

  name               = "Application-Load-Balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http_ssh_traffic.id]
  subnets            = [aws_subnet.Public-subnet.id, aws_subnet.Public-subnet-2.id]
  tags = {
    Name = "ALB"
  }
}

resource "aws_lb_target_group" "web-target-group" {
  name     = "example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc-1.id
  tags = {
    Name = "Web Target Group"
  }
}

resource "aws_lb_listener" "web-listner" {
  load_balancer_arn = aws_lb.ALB.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web-target-group.arn
  }
}

# Method 1 : Where we are attaching target 1 by 1 i.e. web server ec2 instances
# resource "aws_lb_target_group_attachment" "lb_target_attach_1" {
#   target_group_arn = aws_lb_target_group.web-target-group.arn
#   target_id        = aws_instance.web_server-1.id
#   port             = 80
# }

# resource "aws_lb_target_group_attachment" "lb_target_attach_2" {
#   target_group_arn = aws_lb_target_group.web-target-group.arn
#   target_id        = aws_instance.web_server-2.id
#   port             = 80
# }

# Method 2 : Using for-each concept.
# for_each is a meta-argument used to create multiple instances of a resource or module from a map or set of strings, 
# instead of duplicating the resource block multiple times.
resource "aws_lb_target_group_attachment" "web_server_attachments" {
  for_each = {
     web1 = aws_instance.web_server-1.id
     web2 = aws_instance.web_server-2.id
  }

  target_group_arn = aws_lb_target_group.web-target-group.arn
  target_id        = each.value
  port             = 80
}
