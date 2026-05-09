#!/bin/bash
# Pre-commit hook: projects/*.md 및 applications/*.md 변경 감지
# Claude Code PreToolUse hook for Bash tool

COMMAND="$TOOL_INPUT"

# git commit 명령인지 확인
if echo "$COMMAND" | grep -q "git commit"; then
  # projects/*.md가 staged 파일에 포함되어 있는지 확인
  if git diff --cached --name-only 2>/dev/null | grep -q "^projects/.*\.md$"; then
    echo "IMPORTANT: 프로젝트 콘텐츠가 변경되었습니다. 커밋 전에 /portfolio-review를 실행하여 포트폴리오 콘텐츠를 검수해주세요. docs/portfolio_analysis.md 기준에 맞는지 확인이 필요합니다."
  fi

  # projects/*_project.md 변경 시 resume-sync 안내
  if git diff --cached --name-only 2>/dev/null | grep -q "^projects/.*_project\.md$"; then
    echo "IMPORTANT: 프로젝트 성과 데이터가 변경되었습니다. /resume-sync를 실행하여 이력서와 메트릭 레지스트리를 동기화해주세요."
  fi

  # applications/**/*.md 변경 시 JD 미러링 확인 안내
  if git diff --cached --name-only 2>/dev/null | grep -q "^applications/.*\.md$"; then
    echo "IMPORTANT: 기업 지원 자료가 변경되었습니다. 칵테일 전략 배합과 JD 미러링이 올바른지 확인해주세요."
  fi
fi
