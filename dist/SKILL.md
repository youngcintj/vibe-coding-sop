---
name: vibe-coding-sop
description: 5-阶段+4-横向+6-维技术评估的 vibe-coding 标准 SOP。适用任何 AI 写代码任务(后端/前端/全栈/脚本)。用户派 vibe-coding 任务时自动加载,按需求确认→技术评估→开发→测试→代码审查的流程走,强制 Git 版本控制,每步必报告(执行思路+风险+建议)。
---

# Vibe-Coding SOP v1

**适用范围**:任何 AI 写代码类任务(后端 / 前端 / 全栈 / 脚本 / 数据处理 / 自动化)
**目标用户**:PM(产品经理)或技术决策者,希望 AI 按规范流程交付代码

---

## 5 个核心阶段

### ① 需求确认
- 主 skill: `brainstorming` + `interview-me` + `idea-refine`
- 输出: 需求规格 + 验收标准 + 风险点 + 后续建议
- **必拍板**:需求边界(不做啥) / 验收标准(用户用得顺的行为) / 优先级(MVP vs 完整)

### ② 技术评估
- 主 skill: `tech-stack-evaluator` + `doubt-driven-development`
- 输出: 6 维评估矩阵 + 推荐方案 + 1-2 个备选
- **必拍板**:技术选型 / 库 / 方案

### ③ 开发
- **3.0 Git 初始化(强制,第一件事)**:`git init` + `.gitignore` + 第一次 commit
- **3.1 后端**:`api-and-interface-design` + `source-driven-development` + `security-and-hardening` + `systematic-debugging`
- **3.2 前端**:`frontend-ui-engineering` + `design-taste-frontend` + `impeccable`
- **3.3 设计规范沉淀(关键!)**: 必出 `docs/design-system.md`(配色/字号/间距/圆角/组件/动效)
- **3.4 增量交付**:`incremental-implementation` + `executing-plans` — 每完成小功能就 commit

### ④ 测试
- 主 skill: `code-test-expert` + `test-driven-development`
- 输出: 测试计划 + **串行测试用例**(用户按顺序点完一遍)
- 辅助: `verification-before-completion` + `browser-testing-with-devtools`

### ⑤ 定期代码审查
- 触发条件: 累计 commit ≥ 20 / 大版本前 / 用户主动
- 主 skill: `code-review-and-quality` + `requesting-code-review` + `doubt-driven-development`
- 输出: 报告(优化点 / 没把握 / 风险)→ 用户拍板修缮

---

## 4 个横向要求(每个阶段必走)

- **A. 执行思路**:做了什么 / 怎么做的 / 关键决策
- **B. 风险点**:可能踩的坑 / 边界情况 / 已知问题
- **C. 后续建议**:下一步 / 类似项目借鉴
- **D. 强制 Git**:项目第一天 `git init`,大变更 `git tag`(semver),回滚 `git checkout <tag>`,删文件用可恢复删除工具(`mavis-trash` Mavis 生态 / `trash-cli` 跨平台 npm i -g trash-cli / 系统回收站),绝不 `rm -rf`

---

## 6 维技术评估矩阵(权重)

| 维度 | 权重 | 评估项 |
|---|---|---|
| 功能匹配 | 30% | 是否覆盖所有需求场景 |
| 团队熟悉度 | 20% | 团队是否已有经验,上手成本 |
| 性能/可扩展 | 15% | 当前 + 未来 6 个月的承载能力 |
| 维护性 | 15% | 文档/社区活跃度/breaking change 频率 |
| 生态/集成 | 10% | 与现有系统的对接成本 |
| 长期成本 | 10% | 训练/LLM 推理/服务器/人力 |

每个关键技术决策(框架/库/DB/LLM/部署/SaaS)都要走这矩阵。

---

## 必拍板点(任何阶段遇到都要问,不擅自做主)

- 需求边界 / 验收标准 / 优先级
- 技术选型 / 库 / 方案
- 改 schema / 业务阈值 / LLM prompt persona / UI 重要位置
- 设计规范变更
- 代码审查后的修缮决策

---

## 报告格式(每步必给)

```
## [阶段 X] 执行报告

### 执行思路
- 做了什么 / 怎么做的 / 关键决策

### 风险点
- 可能踩的坑 / 边界情况

### 后续建议
- 下一步 / 类似项目借鉴
```

---

## 不适用场景(可跳过部分流程)

- **PoC 一次性**:可跳过 Git 强制 + 评估矩阵
- **用户明确说"你随便改"**:可跳过拍板环节
- **小修改(typo / 文案 / 颜色)**:自动处理,不进 SOP

---

## 详细文档

每个阶段的详细 skill 列表和模板见 `references/`:
- `stage-1-requirements.md`
- `stage-2-tech-eval.md`
- `stage-3-development.md`
- `stage-4-testing.md`
- `stage-5-code-review.md`

完整 SOP 9KB 文档: `https://github.com/youngcintj/vibe-coding-sop/blob/main/sop-v1.md`
