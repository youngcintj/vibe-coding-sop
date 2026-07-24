# Changelog

所有重要变更都记录在这里。格式基于 [Keep a Changelog](https://keepachangelog.com/zh-CN/1.0.0/)。

## [v1.1.1] - 2026-07-24

### Added (依赖管理方案C)

**三层依赖解决方案**：
- `skill.json`：声明按阶段分组的 required/optional skills 列表
- README：新增按阶段分组的依赖表格，最小必装组合 + 按阶段补装脚本
- SKILL.md：每个阶段独立列出 required/optional skills，required 加粗标注；前置检查改为"每阶段独立检查"说明

### Changed (V1→V2→V3 三轮实战迭代)

**V2 补丁（来自数据看板/微信脚本两次实际执行反馈）**：
- 阶段前置检查：新增"任务类型判断"，区分"实际开发"和"评估/流程验证"分支
- 阶段1：新增"关键问题清单"（5类必过问题）+ "每次最多2问/批"节奏约束
- 阶段2：6维矩阵改为 Markdown 模板表（直接复制填写，减少60%机械重复）
- 阶段5：代码审查报告"没把握的地方"强制包含两方案具体文字描述

**V3 补丁（来自注册登录API任务实际执行反馈）**：
- P0 推断原则：PM 明确说了某技术选型时，相关子选型直接用最成熟方案不问（FastAPI/bcrypt/JWT→自动锁定）
- P0 反例挑战：每个推荐方案必须跑"反面假设→找反证→结论"，不再是空步骤
- P1 一键验证脚本：阶段4产出加 `tests/e2e-verify.sh` 模板，PM 点一下就跑完
- P1 不做清单贯穿全程：每份阶段报告末尾必含🚫清单，代码审查加 §0 对照检查
- P2 worktree 判断规则：3条规则，满足任一则建议用 worktree 隔离
- P2 阶段快照交接：新增 `STAGE_STATE.md`，记录 decided/pending/risk/not_doing

### Deferred (v1.2)
- 阶段2反例挑战格式固化：从"格式指引"变强制检查表（每推荐一方案填一格）
- 推断原则扩展更多模式（如 PM 说"后台管理"→直接推断 AdminBro）

---

## [v1.1.0] - 2026-07-23

### Changed (评审员 v2 反馈 · C+D 修复)

**C. 内联关键指令**(3 处)
- `references/stage-2-tech-eval.md` 新增"6 维评估矩阵(已内置,无需 skill)"提示
- `references/stage-3-development.md` 新增 **§3.2.5 抗 AI Slop 自检清单**(配色/排版/间距/交互/反套路 5 大类 ~25 项),替代 5 个前端审美 skill
- `references/stage-4-testing.md` 新增"必跑硬规则(无论 skill 是否可用)"section(Playwright/curl/串行用例/预期实际栏/反馈/回归库 6 条),替代 3 个测试验证 skill

**D. Fallback 声明**(5 段)
- `references/stage-1-requirements.md` 顶部加 Fallback 声明
- `references/stage-2-tech-eval.md` 顶部加 Fallback 声明
- `references/stage-3-development.md` 顶部加 Fallback 声明
- `references/stage-4-testing.md` 顶部加 Fallback 声明
- `references/stage-5-code-review.md` 顶部加 Fallback 声明

每段声明:列出该阶段引用的所有 skill 名 + "若不可用按内联指令执行,不要因为缺 skill 就跳过本阶段"

### Deferred (A+B 改名/合并,放到 v1.2)

评审员 v2 提出的另外 2 项建议,**暂不动**:
- A. 改名对接(`systematic-debugging` → `debugging-and-error-recovery`,`plan-mode` → `planning-and-task-breakdown`)
- B. 合并/替代(删 `executing-plans` / 合并 `requesting-code-review` + `receiving-code-review`)

**理由**:这些是兼容性优化,不是核心风险;内联指令 + Fallback 声明已堵住最致命的"前端审美 skill 缺失"风险,改名属于锦上添花。等用户反馈时再决定。

---

## [v1.0.1] - 2026-07-23

### Fixed (评审员 v1 反馈)

- **P0 URL 占位符**: `SKILL.md` / `README.md` / `.cursorrules` / `CLAUDE.md` 中所有 `<owner>` 替换为 `youngcintj`
- **P0 安装命令**: `README.md` 的 `npx skills add <owner>/vibe-coding-sop` 替换为 `npx skills add youngcintj/vibe-coding-sop`
- **P2 mavis-trash 未说明**: 6 处 `mavis-trash` 加跨平台 fallback 说明(`mavis-trash` Mavis 生态 / `trash-cli` `npm i -g trash-cli` / 系统回收站)
- **P2 package.json 多余字段**: 删除 `type: "module"` 和 `main: "SKILL.md"`
- **P2 SKILL.md description**: 补充触发场景描述

---

## [v1.0.0] - 2026-07-23

### Added
- 首发。5 阶段 + 4 横向 + 6 维技术评估矩阵
- 4 种分发格式(SKILL.md / .cursorrules / CLAUDE.md / system-prompt-block)
- 5 份阶段详细文档(references/stage-1 ~ stage-5)
- 3 份跨 AI 评审 prompt(eval-prompts/01-chatgpt.md / 02-claude.md / 03-gemini.md)
- Cherry Studio 评审指南(eval-prompts/04-cherry-studio.md)
- User Memory 沉淀:5 阶段 + 4 横向 + 6 维精简骨架
