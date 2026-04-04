# 새 머신 환경 셋업 가이드

> 다른 컴퓨터에서 이 프로젝트를 동일한 수준으로 작업하기 위한 단계별 가이드입니다.

## 사전 요구사항

- Claude Code CLI 설치 완료
- Node.js 20+ 설치
- Git 설치

## Step 1: 프로젝트 클론/동기화

Google Drive 동기화 또는 git clone으로 `pp_with_claude` 폴더를 가져옵니다.

## Step 2: Claude Code 글로벌 설정

```bash
# 모델을 opus로 설정
claude config set model opus
```

## Step 3: oh-my-claudecode (OMC) 플러그인 설치

OMC는 세션 관리, 에이전트 오케스트레이션, 커스텀 스킬 등을 제공합니다.

```bash
# OMC 마켓플레이스 등록
claude plugins add-marketplace omc --source git --url https://github.com/Yeachan-Heo/oh-my-claudecode.git

# OMC 플러그인 활성화
claude plugins enable oh-my-claudecode@omc
```

설치 후 Claude Code를 재시작하면 OMC 기능이 활성화됩니다.
문제가 있으면 `/omc-doctor`로 진단할 수 있습니다.

## Step 4: Vercel 플러그인 활성화

```bash
# Vercel 플러그인 활성화
claude plugins enable vercel@claude-plugins-official
```

첫 사용 시 OAuth 인증이 필요합니다. Claude Code 내에서 Vercel 관련 명령 실행 시 인증 프롬프트가 나타납니다.

## Step 5: Figma MCP 서버 연동

Figma 디자인 파일을 Claude Code에서 직접 참조하려면 MCP 서버를 설정합니다.

1. [Figma 개인 액세스 토큰](https://www.figma.com/developers/api#access-tokens) 발급
2. MCP 서버 설정:

```bash
# Figma MCP 서버는 Claude Code의 MCP 설정을 통해 추가
# 정확한 설정 방법은 Figma MCP 공식 문서를 참조하세요
```

설정 후 Claude Code에서 Figma URL을 전달하면 디자인 컨텍스트를 자동으로 가져옵니다.

## Step 6: job-crawler 커스텀 스킬 복원 (선택)

job-crawler는 머신 로컬 스킬로, 채용 공고를 자동 크롤링/분석합니다.
레포에 포함되어 있지 않으므로 수동 복원이 필요합니다.

### 방법 A: 기존 머신에서 복사

기존 머신의 아래 디렉토리를 새 머신의 동일 경로로 복사:

```
~/.claude/skills/omc-learned/job-crawler/
├── skill.md          # 스킬 정의
├── scripts/
│   ├── crawler.py    # 웹 크롤러 (Wanted, Saramin)
│   ├── analyzer.py   # AI 기반 JD 분석
│   ├── notifier.py   # 이메일 알림 (Gmail SMTP)
│   └── config.json   # 대상 기업 설정
├── data/             # 결과 및 분석 저장
└── templates/
    └── email_template.html
```

### 방법 B: 재생성

Claude Code에서 `/learner` 스킬을 사용하여 `job_crawler.md` 전략 문서를 기반으로 재생성할 수 있습니다.

## Step 7: 프로젝트 실행 및 확인

```bash
# 프로젝트 디렉토리로 이동
cd "pp_with_claude 경로"

# Claude Code 실행
claude
```

### 확인 체크리스트

- [ ] Claude Code가 `CLAUDE.md`를 자동 로드하는지 확인
- [ ] `/portfolio-review` 스킬이 동작하는지 확인
- [ ] key.json 수정 후 커밋 시 pre-commit hook 경고가 나타나는지 확인
- [ ] (OMC 설치 시) OMC 관련 스킬들이 표시되는지 확인

## 자동으로 작동하는 것 (추가 설정 불필요)

레포에 포함된 아래 파일들은 Claude Code 실행 시 자동 로드됩니다:

| 파일 | 기능 |
|------|------|
| `CLAUDE.md` | 프로젝트 컨텍스트 및 작업 규칙 |
| `.claude/settings.json` | PreToolUse hook 설정 |
| `.claude/hooks/pre-commit-review.sh` | key.json 커밋 전 검증 스크립트 |
| `.claude/commands/portfolio-review.md` | `/portfolio-review` 커스텀 스킬 |

## 트러블슈팅

- **OMC 플러그인 인식 안 됨**: `omc update` 실행 후 Claude Code 재시작
- **Figma MCP 연결 실패**: 토큰 만료 여부 확인, 재발급 후 MCP 설정 업데이트
- **pre-commit hook 미작동**: `.claude/hooks/pre-commit-review.sh`에 실행 권한 확인 (`chmod +x`)
- **settings.local.json 관련 권한 팝업**: 정상 동작 — 첫 실행 시 Bash 명령 권한을 승인하면 자동 생성됨
