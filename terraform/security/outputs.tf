output "guardduty_detector_id" {
  description = "GuardDuty detector ID."
  value       = aws_guardduty_detector.this.id
}

output "securityhub_account_id" {
  description = "Security Hub 활성 계정 ID."
  value       = aws_securityhub_account.this.id
}

output "access_analyzer_arn" {
  description = "조직 Access Analyzer ARN."
  value       = aws_accessanalyzer_analyzer.org.arn
}
