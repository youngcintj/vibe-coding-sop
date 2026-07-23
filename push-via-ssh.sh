#!/bin/bash
# 推送到 GitHub (SSH 方式)
# 用法: 把 git@github.com:youngcintj/vibe-coding-sop.git 替换成你实际的 URL

set -e
cd "$(dirname "$0")"

REMOTE_URL="git@github.com:youngcintj/vibe-coding-sop.git"

echo "=== 添加 remote ==="
git remote add origin "$REMOTE_URL"

echo "=== 推 main 分支 ==="
git push -u origin main

echo "=== 推 tag v1.1.0 ==="
git push origin v1.1.0

echo "=== 完成 ==="
echo "GitHub URL: https://github.com/youngcintj/vibe-coding-sop"
