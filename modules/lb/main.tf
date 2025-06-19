resource "aws_lb" "drug_alb" {
  name               = "drug-alb-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_group_ids
  subnets            = var.default_subnet
  # vpc_id                     = var.default_vpc_id
  enable_deletion_protection = false

  tags = {
    Environment = "test"
  }
}

resource "aws_lb_target_group" "drug_alb_tg" {
  name     = "drug-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.default_vpc_id
}

resource "aws_lb_listener" "web_listener" {
  load_balancer_arn = aws_lb.drug_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.drug_alb_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "test" {
  count            = 2
  target_group_arn = aws_lb_target_group.drug_alb_tg.arn
  target_id        = var.webserver_id[count.index]
  port             = 80
}