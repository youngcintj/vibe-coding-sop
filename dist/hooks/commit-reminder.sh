#!/bin/bash
# commit-reminder.sh — vibe-coding-sop 的 PostToolUse 提交提醒
#
# 作用：
#   1) 阶段 3+ 编辑后若改动未提交，温和提醒 git commit（增量交付，见 SKILL.md 3.4）；
#   2) 若当前目录还不是 git 仓库，提醒先 git init（见 SKILL.md 3.0）。
#
# 用法（Claude Code settings.json）：
#   "PostToolUse": [{ "matcher": "Edit|Write|MultiEdit",
#                     "hooks": [{ "type": "command", "command": "bash <skill>/hooks/commit-reminder.sh" }] }]

set -o pipefail

INPUT="$(cat)"
TOOL="$(printf '%s' "$INPUT" | python3 -c "import sys,json;print(json.load(sys.stdin).get('tool_name',''))" 2>/dev/null || true)"

STAGE_FILE=".vibe-stage"
STAGE=""
[ -f "$STAGE_FILE" ] && STAGE="$(cat "$STAGE_FILE" 2>/dev/null | tr -d '[:space:]' | tr '[:upper:]' '[:lower:]')"

# 仅阶段 3+（开发/测试/审查）才提醒提交
case "$STAGE" in
  3|development|4|testing|5|review) ;;
  *) exit 0 ;;
esac

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "💡 vibe-coding-sop：当前目录还不是 git 仓库，先 git init 再继续（见 SKILL.md 3.0）。" >&2
  exit 0
fi

if [ -n "$(git status --porcelain 2>/dev/null)" ]; then
  echo "💡 vibe-coding-sop：有未提交的改动，完成当前小功能后记得 git commit（增量交付，见 SKILL.md 3.4）。" >&2
fi

exit 0
