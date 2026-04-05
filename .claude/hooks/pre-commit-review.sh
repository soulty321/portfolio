#!/bin/bash
# Pre-commit hook: key.json 변경 감지 시 portfolio-review 실행 안내
# Claude Code PreToolUse hook for Bash tool

COMMAND="$TOOL_INPUT"

# git commit 명령인지 확인
if echo "$COMMAND" | grep -q "git commit"; then
  # key.json이 staged 파일에 포함되어 있는지 확인
  if git diff --cached --name-only 2>/dev/null | grep -q "key.json"; then
    echo "IMPORTANT: key.json이 변경되었습니다. 커밋 전에 /portfolio-review를 실행하여 포트폴리오 콘텐츠를 검수해주세요. portfolio_analysis.md 기준에 맞는지 확인이 필요합니다."
  fi
fi
