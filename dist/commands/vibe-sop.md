---
description: 启动 vibe-coding-sop 全流程（需求→评估→开发→测试→审查）。适合 PM 派发的"写代码类"任务：自动先做 git init（新项目），从阶段 1 需求确认开始，逐阶段推进并在关键决策点请求 PM 拍板。
argument-hint: "[项目名称或一句话需求，可选]"
allowed-tools: Read, Write, Edit, Bash, Glob, Grep, AskUserQuestion
---

# Vibe-Coding SOP · 启动器

用户派发了一个"写代码类"任务。按本 skill 的 5 阶段流程推进，不要一上来就写代码。

## 第 0 步：环境准备（强制）

1. 判断是不是 git 仓库：`git rev-parse --is-inside-work-tree`
   - **不是** → 新项目，先 `git init` + 写 `.gitignore`（`.env` / `.bak` / `__pycache__` / `node_modules` 必 ignore），并建 `CHANGELOG.md`
   - **是** → 读 `README.md` + `CHANGELOG.md` 了解现状
2. 判断任务类型（实际开发 vs 评估分支），见 `SKILL.md` 的「任务类型判断」表

> 把当前阶段写入 `.vibe-stage`（值：`1`/`2`/`3`/`4`/`5`），供 hook 安全闸门使用。

## 第 1 步：进入阶段 1 需求确认

读取 `references/stage-1-requirements.md`，按其中的做法 + 关键问题清单 + interview-me 问法，与 PM 对齐需求。

🚫 **安全闸门（阶段 1-2 强制）**：本阶段只产出 Markdown 文档。禁止创建/修改任何项目文件、禁止 git 操作。需求未拍板前不得落地。

**PM 拍板点**：需求边界（明确"不做"什么）/ 验收标准 / 优先级。

## 后续阶段（按需读取 `references/`）

- 阶段 1 拍板后 → 读 `stage-2-tech-eval.md` → PM 拍板方案
- 方案拍板后 → 读 `stage-3-development.md`（3.0 git init 解除闸门 → 3.1 后端 → 3.2 前端 → 3.3 设计规范 → 3.4 增量交付）
- 开发完 → 读 `stage-4-testing.md`（串行测试用例 + 一键验证脚本）
- commit≥20 / 大版本前 / PM 主动 → 读 `stage-5-code-review.md`
- 每个阶段报告用 `SKILL.md` 末尾的「阶段报告格式」，且必须包含"本次 MVP 不做"清单

用户给的参数：$ARGUMENTS
