variable "aws_region" {
  description = "보안 서비스를 구성할 리전(lab SCP 허용: ap-northeast-2, us-east-1)."
  type        = string
  default     = "ap-northeast-2"
}

variable "common_tags" {
  description = "공통 태그."
  type        = map(string)
  default = {
    ManagedBy = "github-actions"
    Workload  = "security-tooling"
  }
}
