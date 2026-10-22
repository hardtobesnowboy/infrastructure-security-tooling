# Security Hub: 위임관리자 계정에서 활성화 + 조직 자동등록 + 표준 구독 + 리전 집계.

resource "aws_securityhub_account" "this" {}

# 조직 멤버 자동 등록.
resource "aws_securityhub_organization_configuration" "this" {
  auto_enable = true
  depends_on  = [aws_securityhub_account.this]
}

# AWS Foundational Security Best Practices 표준 구독(대표 1개, 확장 가능).
resource "aws_securityhub_standards_subscription" "fsbp" {
  standards_arn = "arn:aws:securityhub:${var.aws_region}::standards/aws-foundational-security-best-practices/v/1.0.0"
  depends_on    = [aws_securityhub_account.this]
}

# 여러 리전 findings 를 홈리전으로 집계.
resource "aws_securityhub_finding_aggregator" "this" {
  linking_mode = "ALL_REGIONS"
  depends_on   = [aws_securityhub_account.this]
}
