# Vibe-Coding SOP v1

> **5 阶段 + 4 横向 + 6 维**的 AI 写代码标准流程。给 PM 和技术决策者用。

## 这是什么

一套**规范 AI 写代码过程**的标准流程,避免 AI 凭感觉直接上手写,降低返工和方向错的风险。

适用场景:任何 AI 写代码任务(后端 / 前端 / 全栈 / 脚本 / 数据处理 / 自动化)。

**核心目标**:
- 需求别瞎理解 — 必走访谈 + 评估
- 代码别瞎写 — 后端可靠 / 前端审美在线 / 设计规范沉淀
- 测试别瞎跑 — 串行用例让用户快速验证主功能
- 改代码别瞎改 — 定期代码审查,PM 拍板

## 5 个阶段(必走)

```
需求确认 → 技术评估 → 开发 → 测试 → 定期代码审查
   ↑                                       ↓
   └───────────── 持续迭代 ─────────────────┘
```

| 阶段 | 干啥 | 必拍板点 |
|---|---|---|
| **① 需求确认** | 深度访谈 + 头脑风暴,产出需求规格 | 边界 / 验收标准 / 优先级 |
| **② 技术评估** | 6 维评估矩阵,推荐 + 备选 | 技术选型 / 库 / 方案 |
| **③ 开发** | 后端 + 前端 + 设计规范 + 增量提交 | 详见下方"开发子阶段" |
| **④ 测试** | 测试计划 + 串行用例 | 测试范围 / 串行用例确认 |
| **⑤ 定期代码审查** | 优化点 + 没把握 + 风险 → PM 拍板 | 修缮决策 |

### 开发子阶段(③ 必走)

- **3.0 Git 初始化** (强制,第一件事)
- **3.1 后端开发**
- **3.2 前端开发**
- **3.3 设计规范沉淀** (必出 `docs/design-system.md`)
- **3.4 增量交付** (每完成小功能就 commit)

## 4 个横向要求(每个阶段必走)

| 要求 | 含义 |
|---|---|
| **A. 执行思路** | 做了什么 / 怎么做的 / 关键决策 |
| **B. 风险点** | 可能踩的坑 / 边界情况 / 已知问题 |
| **C. 后续建议** | 下一步 / 类似项目借鉴 |
| **D. 强制 Git** | 项目第一天 `git init` + `.gitignore`,大变更 `git tag`,回滚 `git checkout <tag> -- <path>`,删文件用可恢复删除工具(`mavis-trash` / `trash-cli` / 系统回收站),绝不 `rm -rf` |

## 6 维技术评估矩阵

每个关键技术决策(框架/库/DB/LLM/部署/SaaS)都走这矩阵:

| 维度 | 权重 |
|---|---|
| 功能匹配 | 30% |
| 团队熟悉度 | 20% |
| 性能/可扩展 | 15% |
| 维护性 | 15% |
| 生态/集成 | 10% |
| 长期成本 | 10% |

详细评估项见 `references/stage-2-tech-eval.md`。

## 快速使用

### 方式 1: 安装为 skill (推荐)

任何支持 [skills 生态](https://skills.sh/) 的 AI 客户端:

```bash
npx skills add youngcintj/vibe-coding-sop
```

### 方式 2: Cursor / Claude Code 等 IDE

- **Cursor**: 复制 `.cursorrules` 到项目根
- **Claude Code**: 复制 `CLAUDE.md` 到项目根(AGENTS.md 也行,Claude Code 兼容)
- **Windsurf**: 复制 `.cursorrules` 内容到 `.windsurfrules`
- **Aider**: `aider --read CONVENTIONS.md`(从本仓库的 .cursorrules 复制内容)

### 方式 3: 贴 prompt 块

任何不支持 skill 的 AI 工具(ChatGPT 网页版 / Claude.ai 等):

复制 `prompts/system-prompt-block.md` 的内容到 **Custom Instructions** 或 **System Prompt**。

### 方式 4: 给团队分享

把这个仓库链接发给团队,README 顶部就是上手指南。

## 不适用场景(可跳过部分流程)

- **PoC 一次性**:可跳过 Git 强制 + 评估矩阵
- **用户明确说"你随便改"**:可跳过拍板环节
- **小修改(typo / 文案 / 颜色)**:自动处理

## 仓库结构

```
vibe-coding-sop/
├── SKILL.md                    # npx skills 入口
├── README.md                   # 本文件,团队分享
├── package.json                # skill 元数据
├── .cursorrules                # Cursor IDE 规则
├── CLAUDE.md                   # Claude Code 规则
├── prompts/
│   └── system-prompt-block.md  # 可粘贴的 prompt 块
└── references/
    ├── stage-1-requirements.md
    ├── stage-2-tech-eval.md
    ├── stage-3-development.md
    ├── stage-4-testing.md
    └── stage-5-code-review.md
```

## 修订记录

- **v1.1.3 (2026-07-28)**: P0 工程化——frontmatter 标准元数据 + 阶段 1-2 安全闸门 + 渐进式加载指示
- **v1.0 (2026-07-23)**: 首发。5 阶段 + 4 横向 + 6 维矩阵定型

## 许可

MIT
