#!/bin/bash
# guard-stage.sh — vibe-coding-sop 的 PreToolUse 安全闸门
#
# 作用：阶段 1-2（需求确认 / 技术评估）期间，禁止 Write/Edit 等写文件工具，
#       强制 AI 只产出 Markdown 文档，方案未获 PM 拍板前不得落地（对齐 RIPER-5 阶段禁写）。
#
# 用法（Claude Code settings.json）：
#   "PreToolUse": [{ "matcher": "Write|Edit|MultiEdit|NotebookEdit",
#                    "hooks": [{ "type": "command", "command": "bash <skill>/hooks/guard-stage.sh" }] }]
#
# 读取 .vibe-stage 标记（值：1|2|3|4|5 或 requirements|tech-eval|development|testing|review）。
# 缺省（无标记文件）放行，避免破坏非 SOP 场景。

set -o pipefail

INPUT="$(cat)"
TOOL="$(printf '%s' "$INPUT" | python3 -c "import sys,json;print(json.load(sys.stdin).get('tool_name',''))" 2>/dev/null || true)"

STAGE_FILE=".vibe-stage"
STAGE=""
[ -f "$STAGE_FILE" ] && STAGE="$(cat "$STAGE_FILE" 2>/dev/null | tr -d '[:space:]' | tr '[:upper:]' '[:lower:]')"

case "$STAGE" in
  1|requirements|2|tech-eval)
    if [[ "$TOOL" =~ ^(Write|Edit|MultiEdit|NotebookEdit)$ ]]; then
      echo "🚫 vibe-coding-sop 安全闸门：当前处于阶段 $STAGE（需求确认 / 技术评估），只准产出 Markdown 文档。" >&2
      echo "   请勿创建或修改项目文件。进入阶段 3（开发）后自动解除。用 /vibe-sop 查看流程。" >&2
      exit 2   # PreToolUse 非零退出 = 阻止本次工具调用
    fi
    ;;
esac

exit 0
