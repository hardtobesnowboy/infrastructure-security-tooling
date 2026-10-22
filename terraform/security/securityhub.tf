# Security Hub: 위임관리자 지정(관리계정 C단계) 시 security-tooling 계정에 자동 활성화되고
# 기본 표준(FSBP/CIS)도 자동 구독된다. 따라서 account/표준을 새로 만들지 않고
# "조직 설정"과 리전 집계만 관리한다.
# (새로 aws_securityhub_account / FSBP 구독을 만들면 "already enabled/subscribed" 로 apply 실패)

# 조직 멤버 자동 등록.
resource "aws_securityhub_organization_configuration" "this" {
  auto_enable = true
}

# 여러 리전 findings 를 홈리전으로 집계.
resource "aws_securityhub_finding_aggregator" "this" {
  linking_mode = "ALL_REGIONS"
}
