# 인수인계 문서

> 마지막 업데이트: 2026-04-05

## 프로젝트 개요

이 저장소는 프로덕트 디자이너(UX/UI) **포트폴리오 웹사이트의 콘텐츠 및 에셋 소스**입니다.
실행 가능한 앱이 아니며, 별도의 Vite+React 앱(형제 디렉토리 `pp (1)/`)에서 이 데이터를 소비합니다.

- **포트폴리오 주인**: 문호균(Moon Ho-kyun)
- **프로젝트 수**: 7개 (ListeningMind, Dangun 등)
- **언어**: 한국어/영어 이중 지원 (i18n)

## 핵심 파일 구조

| 파일 | 역할 |
|------|------|
| `key.json` | 200+개 i18n 텍스트 키. 모든 사용자 노출 텍스트의 원본 |
| `projectData.js` | 7개 프로젝트의 구조화된 데이터. key.json 키를 참조 |
| `img_source/` | SVG/PNG 에셋. `p1`~`p7` 폴더별 정리 |
| `portfolio_analysis.md` | 사용자 중심 포트폴리오 전략, 평가자 니즈 분석 |
| `job_crawler.md` | 채용 공고 분석 방법론 |
| `layoyt_composer.md` | 레이아웃 구성 가이드라인 |
| `portfolio_contents_maker.md` | 콘텐츠 구조 가이드 (문제→목표→솔루션→결과) |

## Claude Code 워크플로우

### 콘텐츠 수정 흐름

```
key.json 수정 → git add → git commit 시도
    ↓ (pre-commit hook 자동 실행)
"key.json이 변경되었습니다. /portfolio-review를 실행하세요" 안내
    ↓
/portfolio-review 실행 → portfolio_analysis.md 기준으로 검수
    ↓
검수 통과 → 커밋 진행
```

### 내장 커스텀 스킬 (레포에 포함)

- **`/portfolio-review`** (`.claude/commands/portfolio-review.md`)
  - key.json의 텍스트 품질을 6가지 기준으로 검수
  - 체크: 가독성, 논리 흐름, 데이터 근거, 사용자 중심, 뻔한 표현, 기능 정의서화
  - 프로젝트별 PASS/ISSUE 리포트 출력

### Pre-commit Hook (레포에 포함)

- **`.claude/hooks/pre-commit-review.sh`**
  - key.json이 staged된 상태에서 `git commit` 시 자동 경고
  - `.claude/settings.json`의 PreToolUse hook으로 등록됨

## 머신 로컬 설정 (레포 미포함)

다른 컴퓨터에서 작업할 때 아래 항목은 수동 설정이 필요합니다.
자세한 절차는 `SETUP_GUIDE.md`를 참조하세요.

| 항목 | 설명 |
|------|------|
| Claude Code 글로벌 설정 | 모델: opus |
| oh-my-claudecode (OMC) | 플러그인 — 세션 관리, 에이전트 오케스트레이션 |
| Vercel 플러그인 | 배포 관련 기능 (OAuth 인증 필요) |
| Figma MCP 서버 | 디자인 파일 참조 및 코드 연동 |
| job-crawler 스킬 | `~/.claude/skills/omc-learned/job-crawler/` — 채용 공고 자동 크롤링/분석 |

## 현재 진행 상태

- 7개 프로젝트 데이터 구조 완성 (`projectData.js`)
- key.json 한국어/영어 텍스트 작성 진행 중
- 전략 문서 4개 작성 완료
- portfolio-review 스킬 및 pre-commit hook 구축 완료
- job-crawler 스킬 구축 완료 (머신 로컬)
