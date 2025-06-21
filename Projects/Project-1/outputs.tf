output "public_ip_of_web_servers" {
    value = {
        web_server_1 = aws_instance.web_server-1.public_ip
        web_server_2 = aws_instance.web_server-2.public_ip
    }
}

output "alb_target_group_info"{

    value = {
        alb_tg_stickiness=aws_lb_target_group.web-target-group.stickiness
        alb_tg_protocol=aws_lb_target_group.web-target-group.protocol
    }
}

output "alb_dns" {
  
  value = [aws_lb.ALB.dns_name, aws_lb.ALB.internal] 
}