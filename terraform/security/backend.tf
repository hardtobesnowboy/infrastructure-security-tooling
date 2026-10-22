# state 는 Security Tooling 계정의 S3 버킷(커스터마이징이 생성)에 저장.
# 잠금은 S3 네이티브 lockfile(DynamoDB 없음). 버킷 기본 암호화(KMS)가 적용되므로
# kms_key_id 는 생략(버킷 default encryption 사용).
terraform {
  backend "s3" {
    bucket       = "infrastructure-security-tooling-tfstate-929523583415"
    key          = "security-tooling/terraform.tfstate"
    region       = "ap-northeast-2"
    use_lockfile = true
    encrypt      = true
  }
}
