#!/bin/bash
# 推送到 GitHub (GitHub CLI 方式 · 一键搞定)
# 前置: brew install gh && gh auth login

set -e
cd "$(dirname "$0")"

echo "=== 检查 gh CLI ==="
if ! command -v gh &> /dev/null; then
    echo "未安装 gh,brew install gh"
    exit 1
fi

echo "=== 检查登录状态 ==="
gh auth status 2>&1 | head -5

echo "=== 创建 GitHub 仓库 + push ==="
# 这一步会:
# 1. 在 GitHub 上创建 youngcintj/vibe-coding-sop(public)
# 2. 添加 remote
# 3. 推 main + tag
gh repo create youngcintj/vibe-coding-sop \
    --public \
    --description "5-阶段+4-横向+6-维技术评估的 AI 写代码标准 SOP" \
    --source=. \
    --remote=origin \
    --push

echo "=== 推 tag v1.1.0 ==="
git push origin v1.1.0

echo "=== 完成 ==="
echo "GitHub URL: https://github.com/youngcintj/vibe-coding-sop"
