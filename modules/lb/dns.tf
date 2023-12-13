data "aws_route53_zone" "main" {
  name = "techstellar.link"
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.main.zone.vpc_id
  name    = "www.${data.aws_route53_zone.main.name}"
  type    = "CNAME"
  ttl     = "300"
  records = [aws_lb.main.dns_name]
}
