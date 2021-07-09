## Creates a new Route53 Public Hosted Zone. Comment out for existing zone.
resource "aws_route53_zone" "app-domain" {
  name = "${var.domain}."
}

## Points to your existing Route 53 public hosted zone. Comment this block if you are creating a new Public Hosted Zone
#data "aws_route53_zone" "hosted_zone" {
#  name = "${var.domain_name}." 
#}

resource "aws_route53_record" "app-domain" {
  zone_id = aws_route53_zone.app-domain.zone_id    ## Delete prepending "data." if you are creating a new hosted zone
  name    = "${aws_route53_zone.app-domain.name}." ## Delete prepending "data." if you are creating a new hosted zone
  type    = "A"

  alias {
    name                   = var.cloudfront-dist
    zone_id                = aws_route53_zone.app-domain.zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www_cname" {
  zone_id = aws_route53_zone.app-domain.zone_id        ## Delete prepending "data." if you are creating a new hosted zone
  name    = "www.${aws_route53_zone.app-domain.name}." ## Delete prepending "data." if you are creating a new hosted zone
  type    = "CNAME"
  ttl     = "300"
  records = ["${var.domain}."]
}