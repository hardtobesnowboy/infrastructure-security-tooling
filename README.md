# infrastructure-security-tooling (lab)

Security Tooling 계정(`929523583415`)에서 **GitHub Actions OIDC**로 조직 보안 서비스를 구성하는 전용 리포.
AFT 커스터마이징(`aws-aft-account-customizations/infrastructure-security-tooling`)이 그 계정에 미리 깔아둔
OIDC role 과 state 버킷을 사용한다.

## 선행조건

관리계정(`TF/lab/security-delegated-admin.tf`)에서 이 계정을 **위임관리자(delegated admin)**로 지정해야
GuardDuty/Security Hub/Access Analyzer 조직 설정이 가능하다. 미지정 시 apply 가 AccessDenied.

## 동작

| 이벤트 | 워크플로 | assume role | 동작 |
|---|---|---|---|
| PR → main | `terraform-plan.yaml` | `gha-terraform-plan` (ReadOnly) | `terraform plan` (미리보기) |
| push → main (PR 병합) | `terraform-apply.yaml` | `gha-terraform-apply` (보안 서비스 권한) | `terraform apply` (실제 배포) |

인증: `aws-actions/configure-aws-credentials`가 GitHub OIDC 토큰으로 Security Tooling 계정의
role 을 직접 assume(1-hop). 저장된 AWS 키 없음.

## 구성

```
terraform/security/      보안 서비스 root module (ap-northeast-2)
  backend.tf             S3 state (infrastructure-security-tooling-tfstate-929523583415, use_lockfile)
  guardduty.tf           detector + org config(auto_enable_organization_members=ALL)
  securityhub.tf         account enable + org config + FSBP 표준 + 리전 집계
  accessanalyzer.tf      조직 analyzer(type=ORGANIZATION)
.github/workflows/       plan(PR) / apply(main push)
```

## 배포

1. feature 브랜치에서 수정 → PR 생성 → plan 워크플로 확인
2. main 병합 → apply 워크플로가 보안 서비스 배포

> 기본값: 리전 ap-northeast-2, Security Hub 표준 = FSBP 1개. 필요 시 리전/표준 확장.
