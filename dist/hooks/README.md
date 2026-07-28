# vibe-coding-sop · 可选 Hooks（Claude Code）

> 纯 Markdown 的 SOP 也能"挂"上可执行钩子，把流程约束变成机器强制，落地率大幅提升（学 `gsd-build/get-shit-done`）。

本目录提供两个 Claude Code 钩子。它们**完全可选**——不装也能用 SOP，只是少了"机器兜底"。

## 钩子清单

| 钩子 | 类型 | 作用 |
|---|---|---|
| `guard-stage.sh` | PreToolUse（匹配 Write/Edit） | 阶段 1-2 期间阻止写文件，强制只产出 Markdown（安全闸门） |
| `commit-reminder.sh` | PostToolUse（匹配 Edit/Write） | 阶段 3+ 编辑后提醒 git commit；未 git init 时提醒初始化 |

钩子靠 `.vibe-stage` 标记文件判断当前阶段。建议在流程启动时写入该文件（命令 `/vibe-sop` 已包含这一步）：

```bash
echo 1 > .vibe-stage        # 阶段 1 需求确认
echo 2 > .vibe-stage        # 阶段 2 技术评估
echo 3 > .vibe-stage        # 阶段 3 开发（闸门解除）
echo 4 > .vibe-stage        # 阶段 4 测试
echo 5 > .vibe-stage        # 阶段 5 代码审查
```

## 安装（Claude Code）

把两个脚本放到某处（如 `~/.claude/vibe-coding-sop/hooks/`），`chmod +x` 后，在项目的 `.claude/settings.json` 加入：

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Write|Edit|MultiEdit|NotebookEdit",
        "hooks": [
          { "type": "command", "command": "bash ~/.claude/vibe-coding-sop/hooks/guard-stage.sh" }
        ]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Edit|Write|MultiEdit",
        "hooks": [
          { "type": "command", "command": "bash ~/.claude/vibe-coding-sop/hooks/commit-reminder.sh" }
        ]
      }
    ]
  }
}
```

PreToolUse 钩子返回非零退出码即**阻止**本次工具调用；脚本把原因打到 stderr，AI 会看到并回到规划阶段。

## 其他客户端

- **Cursor / 通用 AI 工具**：无原生 hook 机制，靠 `SKILL.md` 里的「安全闸门」文字规则 + `/vibe-sop` 命令约束即可。
- **WorkBuddy**：在 skill 内以规则形式生效；可执行钩子可作为进阶配置按需接入。

## 安全说明

两个脚本只读 `.vibe-stage` 与 git 状态，不联网、不写任何文件、不执行危险命令。`guard-stage.sh` 在阶段 1-2 只"拦"不"改"。缺省（无 `.vibe-stage`）一律放行。
