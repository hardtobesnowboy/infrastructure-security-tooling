# IAM Access Analyzer: 조직 레벨 analyzer(위임관리자 계정에서 생성).
# (Access Analyzer 위임관리자 등록은 관리계정 TF/lab/security-delegated-admin.tf 에서 선행)

resource "aws_accessanalyzer_analyzer" "org" {
  analyzer_name = "org-analyzer"
  type          = "ORGANIZATION"
}
