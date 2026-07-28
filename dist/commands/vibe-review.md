---
description: 触发 vibe-coding-sop 阶段 5 代码审查，生成给 PM 的审查报告（优化点 / 没把握的地方 / 风险点 / 整体评价）。适合累计 commit≥20、大版本发布前、或 PM 主动要求时调用。
argument-hint: "[审查范围：commit 数 或 版本号，默认大版本前]"
allowed-tools: Read, Grep, Glob, Bash, Write, AskUserQuestion
---

# Vibe-Coding SOP · 代码审查

按 `SKILL.md`「阶段 5：代码审查」产出给 PM 的报告。

## 做法

1. 读取 `references/stage-5-code-review.md` 了解完整做法与触发条件（commit≥20 / 大版本前 / PM 主动）。
2. 用 `code-review-and-quality` 多维度审查：正确性 / 可读性 / 安全 / 性能 / 可维护。
3. 用 `doubt-driven-development` 对抗性审查：假设每个推荐方案的反面成立，找一个反证。
4. 对照 `docs/design-system.md`（如有）查设计规范一致性，对照 `STAGE_STATE.md` 的 `not_doing` 查范围蔓延。
5. 按 `SKILL.md` 的「代码审查报告模板」产出：
   - **0. MVP 不做清单对照**：代码里若出现"不做清单"内容，标记范围蔓延
   - **1. 优化点**：文件:行号 + 现状 + 建议 + 收益
   - **2. 没把握的地方**：必须含方案A / 方案B 的**具体文字描述**，不能只写标签
   - **3. 风险点**：风险 + 触发条件 + 缓解方案
   - **4. 整体评价**：优/良/中/差 + 后续方向
6. PM 拍板修复范围（全修 / 部分 / 暂不修 / 改设计规范）。

## 注意

- 审查中发现架构级问题（分层不对、选错库）→ **不修**，单独出 ticket，PM 评估后再决定。
- 报告用 `SKILL.md` 末尾的「阶段报告格式」呈现。

审查范围：$ARGUMENTS
