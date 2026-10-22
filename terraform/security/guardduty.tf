# GuardDuty: detector 는 위임관리자 지정(관리계정 C단계) 시 security-tooling 계정에
# 자동 생성된다. 따라서 새로 만들지 않고 data 로 참조해 "조직 설정"만 관리한다.
# (새로 aws_guardduty_detector 를 만들면 "detector already exists" 로 apply 실패)

data "aws_guardduty_detector" "this" {}

# 조직의 신규/기존 멤버 계정을 자동 등록(ALL).
resource "aws_guardduty_organization_configuration" "this" {
  detector_id                      = data.aws_guardduty_detector.this.id
  auto_enable_organization_members = "ALL"
}
