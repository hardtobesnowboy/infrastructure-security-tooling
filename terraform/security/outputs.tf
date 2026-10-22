output "guardduty_detector_id" {
  description = "GuardDuty detector ID(위임관리자 지정 시 자동 생성된 것)."
  value       = data.aws_guardduty_detector.this.id
}

output "securityhub_org_auto_enable" {
  description = "Security Hub 조직 멤버 자동 등록 여부."
  value       = aws_securityhub_organization_configuration.this.auto_enable
}

output "access_analyzer_arn" {
  description = "조직 Access Analyzer ARN."
  value       = aws_accessanalyzer_analyzer.org.arn
}
