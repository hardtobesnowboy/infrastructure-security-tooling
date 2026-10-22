# 크레덴셜은 GitHub Actions 워크플로의 OIDC(configure-aws-credentials)로 주입된다.
# 따라서 여기서 assume_role 를 쓰지 않는다(AFT 커스터마이징의 jinja provider 와 다른 점).
provider "aws" {
  region = var.aws_region
  default_tags {
    tags = var.common_tags
  }
}
