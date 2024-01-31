resource "aws_route53_zone" "domain" {
  name = "moesportfolio.com"
}

resource "aws_route53_record" "lb-record" {
    zone_id = aws_route53_zone.domain.id
    name = "www"
    type = "A"

    alias {
      name = aws_lb.lb.dns_name
      zone_id = aws_lb.lb.zone_id
      evaluate_target_health = true
    }
}


output "lb_dns_name" {
  description = "The DNS name of the load balancer"
  value = aws_lb.lb.dns_name
}