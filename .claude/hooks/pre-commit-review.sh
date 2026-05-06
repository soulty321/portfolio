#!/bin/bash
# Pre-commit hook: projects/*.md 변경 감지 시 portfolio-review 실행 안내
# Claude Code PreToolUse hook for Bash tool

COMMAND="$TOOL_INPUT"

# git commit 명령인지 확인
if echo "$COMMAND" | grep -q "git commit"; then
  # projects/*.md가 staged 파일에 포함되어 있는지 확인
  if git diff --cached --name-only 2>/dev/null | grep -q "^projects/.*\.md$"; then
    echo "IMPORTANT: 프로젝트 콘텐츠가 변경되었습니다. 커밋 전에 /portfolio-review를 실행하여 포트폴리오 콘텐츠를 검수해주세요. docs/portfolio_analysis.md 기준에 맞는지 확인이 필요합니다."
  fi
fi
