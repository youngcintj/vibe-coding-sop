#!/bin/bash
# 推送到 GitHub (HTTPS + Personal Access Token 方式)
# 用法: 把 https://github.com/youngcintj/vibe-coding-sop.git 替换成你实际的 URL
#       第一次 push 时会要求输入 username + PAT(token 不是密码)

set -e
cd "$(dirname "$0")"

REMOTE_URL="https://github.com/youngcintj/vibe-coding-sop.git"

echo "=== 添加 remote ==="
git remote add origin "$REMOTE_URL"

echo "=== 推 main 分支(会要求 username + PAT)==="
git push -u origin main

echo "=== 推 tag v1.1.0 ==="
git push origin v1.1.0

echo "=== 完成 ==="
echo "GitHub URL: https://github.com/youngcintj/vibe-coding-sop"
echo ""
echo "如果 push 时报 'Support for password authentication was removed':"
echo "1. 去 https://github.com/settings/tokens 生成 PAT (勾 repo 权限)"
echo "2. push 时 username = youngcintj, password = PAT(不是 GitHub 密码)"
echo "3. 想免输入可以配 git credential helper(见 README)"
