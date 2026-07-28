# Vibe-Coding SOP

> **5 阶段 + 4 横向 + 6 维技术评估**的 AI 写代码标准 SOP。
> 适用任何 AI 工具(Claude Code / Cursor / Cherry Studio / WorkBuddy / Mavis / 网页 LLM)。
> 跨项目通用:后端 / 前端 / 全栈 / 脚本 / 数据处理 / 自动化。

## 这是什么

给 PM / 技术决策者用的 **AI 编程规范工作流**,避免 AI 凭感觉直接上手写代码。

| 痛点 | 解决方案 |
|---|---|
| AI 听完需求就开始写,容易写偏 | **阶段 1 需求确认** + 边界/验收/优先级拍板 |
| AI 选技术栈凭感觉 | **阶段 2 技术评估** + 6 维矩阵 |
| AI 写的代码前后端不统一 | **阶段 3 开发** + 必出 `docs/design-system.md` |
| AI 写完不测试 / 测得不充分 | **阶段 4 测试** + 串行用例 + Playwright/curl 实测 |
| 越改越烂,没人审查 | **阶段 5 定期代码审查** + 优化点/没把握/风险 报告 |
| AI 写代码没有版本控制 | **强制 Git**(init → tag → checkout 回滚) |
| AI 凭记忆编码,不看文档 | **source-driven-development** + 凭记忆编码前先看官方文档 |
| 前端 UI 一股 AI 味 | **抗 AI Slop 自检清单**(~25 项硬规则) |

## 5 阶段速览

```
① 需求确认 → ② 技术评估 → ③ 开发 → ④ 测试 → ⑤ 定期代码审查
   ↑                                              ↓
   └──────────────── 持续迭代 ─────────────────────┘
```

详细见 [`sop-v1.md`](sop-v1.md)(9KB) + [`dist/references/`](dist/references/)(5 份分阶段文档)

## 5 分钟上手

### 方式 1:装成 skill(推荐)
```bash
npx skills add youngcintj/vibe-coding-sop
```

> ⚠️ **首次安装后**：skill 依赖 9 个其他 skill，首次运行时会在"阶段前置检查"中提示缺失项。
> 用 `npx skills add <name>` 补装缺失的 required skills。完整列表见下方。

### 依赖说明

vibe-coding-sop **每个阶段独立列出 required/optional skills**，不需要一次性装完所有 skill。按阶段安装即可。

> optional skills 缺失时，vibe-coding-sop 会按内联指令 fallback 执行，不卡流程。

| 阶段 | Required（必装） | Optional（推荐装） |
|---|---|---|
| **阶段1 需求确认** | `brainstorming` `idea-refine` | `interview-me` `planning-and-task-breakdown` |
| **阶段2 技术评估** | `tech-stack-evaluator` | `doubt-driven-development` |
| **阶段3 开发** | `git-workflow-and-versioning` `api-and-interface-design` `frontend-ui-engineering` `incremental-implementation` | `using-git-worktrees` `source-driven-development` `security-and-hardening` `debugging-and-error-recovery` `observability-and-instrumentation` `design-taste-frontend` `impeccable` `design-is` `UI Design Master` |
| **阶段4 测试** | `code-test-expert` `verification-before-completion` | `test-driven-development` |
| **阶段5 代码审查** | `code-review-and-quality` | （已合并 requesting/receiving 自评与反馈职责） |

**推荐安装顺序**（按阶段走）：先装阶段1，再按需装后续阶段。

**最小必装组合**（核心流程）：
```bash
npx skills add brainstorming idea-refine tech-stack-evaluator git-workflow-and-versioning api-and-interface-design frontend-ui-engineering code-review-and-quality code-test-expert incremental-implementation verification-before-completion
```

**按阶段补装**：
```bash
# 阶段1 补 optional
npx skills add interview-me planning-and-task-breakdown

# 阶段2 补 optional
npx skills add doubt-driven-development

# 阶段3 补 optional
npx skills add using-git-worktrees source-driven-development security-and-hardening debugging-and-error-recovery observability-and-instrumentation design-taste-frontend impeccable design-is

# 阶段4 补 optional
npx skills add test-driven-development

# 阶段5 optional 已合并进 code-review-and-quality,无需单独安装
```

### 方式 2:IDE 规则文件
- **Cursor**:复制 `dist/.cursorrules` 到项目根
- **Claude Code / OpenCode / Codex / Devin**:复制 `dist/CLAUDE.md` 到项目根
- **Windsurf**:复制 `dist/.cursorrules` 内容到 `.windsurfrules`
- **Aider**:`aider --read CONVENTIONS.md`(从 `.cursorrules` 复制内容)

### 方式 3:贴 prompt 块
任何 AI 工具(ChatGPT / Claude.ai / Gemini / 飞书 AI):
1. 打开 [`dist/prompts/system-prompt-block.md`](dist/prompts/system-prompt-block.md)
2. 复制 `===` 之间的内容
3. 粘贴到 Custom Instructions / System Prompt

### 方式 4:WorkBuddy
WorkBuddy 5 份 references 都加了 **Skill Fallback 声明**,引用的 skill 若不可用,按本文档内联指令执行。

## 仓库结构

```
vibe-coding-sop/
├── README.md                          # 本文件(仓库入口)
├── CHANGELOG.md                       # 变更日志
├── sop-v1.md                          # 完整 SOP 9KB 详细版
├── dist/                              # 分发版(4 种格式 + 5 份 references)
│   ├── SKILL.md                       # npx skills add 入口
│   ├── README.md                      # 团队分享说明
│   ├── .cursorrules                   # Cursor 规则
│   ├── CLAUDE.md                      # Claude Code 规则
│   ├── package.json                   # npx skills 元数据
│   ├── prompts/system-prompt-block.md # 可粘贴 prompt 块
│   ├── commands/                     # 可选 Claude Code 斜杠命令
│   │   ├── vibe-sop.md
│   │   └── vibe-review.md
│   ├── hooks/                        # 可选 Claude Code 钩子
│   │   ├── guard-stage.sh
│   │   ├── commit-reminder.sh
│   │   └── README.md
│   ├── examples/                     # 端到端示例
│   │   └── end-to-end-todo-cli.md
│   └── references/                    # 5 份阶段详细文档
│       ├── stage-1-requirements.md
│       ├── stage-2-tech-eval.md
│       ├── stage-3-development.md
│       ├── stage-4-testing.md
│       └── stage-5-code-review.md
├── eval-prompts/                      # 跨 AI 评审 prompt
│   ├── 01-chatgpt.md
│   ├── 02-claude.md
│   ├── 03-gemini.md
│   ├── 04-cherry-studio.md
│   └── README.md
└── vibe-coding-sop-dist.zip           # 分发包(zip)
```

## 适用 vs 不适用

**适用**:
- 后端 / 前端 / 全栈 / 脚本 / 数据处理 / 自动化
- 中小型项目(MVP / 内部工具 / 团队项目)
- 任何"AI 写代码"任务

**不适用**(可跳过部分流程):
- **PoC 一次性** — 可跳过 Git 强制 + 评估矩阵
- **用户明确说"你随便改"** — 可跳过拍板环节
- **小修改(typo / 文案 / 颜色)** — 自动处理

## 反馈 / 贡献

- **Bug / 问题**:GitHub Issues
- **改进建议**:发 PR
- **3 AI 评审流程**:见 [`eval-prompts/README.md`](eval-prompts/README.md)

## 许可

MIT
