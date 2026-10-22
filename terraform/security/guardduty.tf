# GuardDuty: 위임관리자(Security Tooling) 계정에서 조직 설정.
# (위임관리자 지정은 관리계정 TF/lab/security-delegated-admin.tf 에서 선행)

resource "aws_guardduty_detector" "this" {
  enable = true
}

# 조직의 신규/기존 멤버 계정을 자동 등록(ALL).
resource "aws_guardduty_organization_configuration" "this" {
  detector_id                      = aws_guardduty_detector.this.id
  auto_enable_organization_members = "ALL"
}
