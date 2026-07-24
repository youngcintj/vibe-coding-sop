---
name: vibe-coding-sop
description: |
  结构化 AI 编码工作流（5 阶段 + 4 横向 + 6 维评估矩阵）。当用户（数据部门 PM）给 AI 派"写代码类"任务时使用本流程——从需求到代码审查全链路覆盖。

  触发词（部分匹配即加载）："做个 demo"、"想做一个"、"帮我开发"、"写个功能"、
  "coding 任务"、"vibe-coding"、"按 SOP"、"开始工作流"、"我们走流程吧"。

  不触发：调试报错（用 systematic-debugging）、单次问答（直接答）、纯调研（用 deep-research）、
  用户明确说"随便改 / 一次性的 / 你直接来"（跳过流程直接做）。
---

# Vibe-Coding SOP

PM 派给 AI 的代码任务，统一按此流程走：需求 → 评估 → 开发 → 测试 → 审查，横向要求贯穿全程。

## 阶段前置检查

进入本流程前，先确认：
- [ ] 是 PM 发起的代码类任务（不是调试 / 单次问答）
- [ ] workspace 是新项目（有 AGENTS.md）或已有项目（读过 README + CHANGELOG）
- [ ] 用户没说"随便改 / 一次性的"（说了就直接做，跳过 SOP）

### 任务类型判断

根据性质选择分支：

| 类型 | 特征 | 走哪条 |
|---|---|---|
| **实际开发** | 要产出代码、部署可用 | 完整流程，git init + 开发 |
| **评估/流程验证** | 只验证 SOP 是否合适，或 demo 演示 | 流程走完，但 Git/代码产出改为**文档级描述**（不做实际 git init / 不创建文件） |

> 例：PM 想看 SOP 对某个需求的效果 → 阶段 1-5 全走，目录结构/API设计等以 Markdown 表格/代码块形式产出，不实际创建项目。

**触发"评估分支"的典型场景**：
- 用户说"跑一遍 SOP 看看效果"
- 对比评估两个方案
- PoC 性质的快速验证

## Procedure

### 阶段 1：需求确认

**目标**：把模糊想法变成有验收标准的需求文档。

**Skill**：`brainstorming` + `interview-me` + `idea-refine`

**做法**：
1. 用 `interview-me` 逐一挖掘用户真正想要的，而非他们认为应该要的
2. 用 `brainstorming` 协作式探索，把歧义摊开
3. 用 `idea-refine` 打磨成清晰可执行的概念
4. 如果需求边界不清，先用 `plan-mode` 讨论清楚再继续

**推断原则（减少伪问题）**：
PM 明确说了某个技术选型时，相关子选型直接用该栈的最成熟方案，**只在真正有分歧时才问**：
- PM 说"前端 React" → UI库直接用 Ant Design，不需要问
- PM 说"做个脚本" → CLI库直接用 argparse / 标准库，不需要问
- PM 说"后端 Python" → Web框架直接用 FastAPI，不需要问

**关键问题清单（每个项目必过一遍，至少确认有答案）**：
- **数据来源**：谁来提供数据、放哪里？（如：用户上传 / 程序监控目录 / 固定数据）
- **数据格式**：字段名固定还是灵活识别？（如：固定列名 vs 自动识别任意 CSV）
- **展示内容**：图表类型（折线/柱状/饼）？有几条线/几个维度？需要表格吗？表格要排序/分页吗？
- **交互方式**：手动刷新还是自动轮询？间隔多少秒？要不要筛选器/日期范围？
- **MVP 边界**：这次必须做到什么？哪些是后面加的？（"不做"清单同样重要）

> 每次最多问 2 个问题，分批问。PM 连续回答多个问题意愿会衰减。
> 优先问"推断原则"覆盖不到的问题（数据来源 / MVP 边界 / 有分歧的选型）。

**产出**：
- 需求规格（含验收标准）：什么行为算"做好了"
- 执行思路：任务拆解 + 关键路径
- 风险点：歧义点 / 范围蔓延点 / 隐藏依赖
- 后续建议：技术选型方向 / 类似项目参考

**PM 拍板点（不拍板不往下走）**：
- 需求边界（明确"不做"什么）
- 验收标准（具体可测的行为）
- 优先级（这次 MVP 要什么，完整版可以后面加什么）

### 阶段 2：技术评估（必做，不可跳过）

**目标**：用 6 维矩阵选出推荐方案，PM 确认后才进开发。

**Skill**：`tech-stack-evaluator` + `doubt-driven-development`

**做法**：
1. 用 `tech-stack-evaluator` 对每个技术决策（框架/库/方案）跑 6 维矩阵
2. **反例挑战（每个推荐方案必做）**：写一句话假设反面成立，找一个反证
   - 格式：`推荐方案 → 反面假设 → 反证 → 结论（方案仍成立 / 需要调整）`
   - 例：pandas → "标准库 csv 够用，不需要 pandas" → 反证：pandas 自动处理字段类型，标准库全是 str，大数据量时类型转换成本高 → pandas 仍然优
   - 如果找不到反证，说明反面假设成立，需要换方案
3. 输出：推荐方案 + 1-2 个备选（含优/劣/风险/适配场景）

**6 维矩阵（模板，直接复制填写）**：

```markdown
| 维度 | 权重 | 方案A（推荐） | 方案B | 方案C |
|---|---|---|---|---|
| 功能匹配 | 30% | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ |
| 团队熟悉度 | 20% | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| 性能/可扩展 | 15% | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| 维护性 | 15% | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| 生态/集成 | 10% | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| 长期成本 | 10% | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| **加权总分** | | **4.3/5** | **3.8/5** | **3.5/5** |
```

每列说明：
- 方案A/B/C：替换为实际方案名（如 FastAPI+pandas / Flask+标准库）
- 评分：1-5 星，5=完全满足该维度
- 每行末尾简要说明评分依据（如"pandas 读 CSV 零压力"）
- 加权总分：自动计算或手动估算
- 最后一行**加粗**突出，给 PM 一眼能看到的结论

**PM 拍板点**：选哪个方案进开发，备选方案存为"未来选项"。

### 阶段 3：开发（核心）

**目标**：后端可靠 + 前端有审美 + 设计规范沉淀。

#### 3.0 Git 初始化（强制，第一件事）
- 主 skill：`git-workflow-and-versioning`
- 辅助：`using-git-worktrees`
- **worktree 判断规则（满足任一条件建议用 worktree 隔离）**：
  - 任务涉及 schema/API 契约变更（回滚成本高）
  - PM 要求"先不破坏现有代码"
  - 多人协作同一项目
  - 其他情况：直接在 main 或 feature branch 开发即可
- **强制规则**：
  1. 项目第一天 `git init` + 写好 `.gitignore`（.env / .bak / __pycache__ / node_modules 必 ignore）
  2. 大变更必打 tag（semver v0.X.0 / v0.X.Y）
  3. 回滚优先 `git checkout <tag> -- <path>`，不依赖文件备份 + regex 删
  4. 涉及 schema/阈值/UI 重要位置 → 走 `CHANGELOG.md` append-only 记录

#### 3.1 后端开发
- 主 skill：`api-and-interface-design`
- 辅 skill：`source-driven-development`、`security-and-hardening`、`systematic-debugging`、`observability-and-instrumentation`

#### 3.2 前端开发
- 主 skill：`frontend-ui-engineering` + `design-taste-frontend`
- 辅 skill：`impeccable`、`design-is`、`UI Design Master`

#### 3.3 设计规范沉淀（首次必出）
- 产出：`docs/design-system.md`
  - 配色（主色/辅色/语义色）
  - 字号/字重/行高
  - 间距体系（4/8/12/16/24/32）
  - 圆角/阴影/边框
  - 组件风格（button / card / modal / toast）
  - 动效曲线
  - 暗色模式
- 每次新功能开发前先 grep 设计规范；改规范要 PM 确认

#### 3.4 增量交付
- 主 skill：`incremental-implementation`
- 原则：每完成一个小功能就 commit，不要攒一堆一起提交

#### 3.5 每步横向产出（强制）
每次完成一个子任务，报告：
- **执行思路**：做了什么 / 怎么做的 / 关键决策
- **风险点**：可能踩的坑 / 边界情况 / 已知问题
- **后续建议**：下一步可以做什么 / 类似项目怎么借鉴

### 阶段 4：测试

**目标**：让 PM 拿着串行用例快速验一遍，主功能按需求工作。

**Skill**：`code-test-expert` + `test-driven-development` + `verification-before-completion`

**做法**：
1. 用 `code-test-expert` 生成测试计划（功能/性能/兼容性/异常路径）
2. 生成**串行测试用例**（按顺序执行，每步有明确"通过/不通过"标准）
3. 用 `verification-before-completion` 实测验证，不依赖 LLM 自检

**产出**：
- 测试计划
- 串行测试用例（用户按顺序点完一遍）
- 回归用例库（每次大改前必跑）
- **一键验证脚本**（PM 点一下就跑完，不需要逐条人工核对）：

```bash
#!/bin/bash
# tests/e2e-verify.sh — 替换为实际命令
# 例（脚本类）：
python convert.py sample-chat.txt
test -f sample-chat.json && echo "✅ JSON 生成成功"
python -c "import json; msgs=json.load(open('sample-chat.json')); assert all(k in msgs[0] for k in ['timestamp','sender']); print(f'✅ 字段完整，共{len(msgs)}条')"

# 例（Web 类）：
# cd frontend && npm run dev &
# sleep 5 && curl -s http://localhost:5173 | grep -q "数据" && echo "✅ 页面渲染成功"
```

> 一键脚本放在 `tests/e2e-verify.sh`，提交到 git，每次大改前 PM 或 CI 运行一次即可。

### 阶段 5：代码审查

**目标**：定期让 PM 看到优化点 + 没把握的地方，PM 决定修不修。

**触发条件**：累计 commit ≥ 20 / 大版本(v0.X.0)发布前 / PM 主动要求。

**Skill**：`code-review-and-quality` + `requesting-code-review` + `receiving-code-review`

**产出（给 PM 的报告模板）**：

```
## 代码审查报告 · v0.X.0

### 0. MVP 不做清单（审查时对照）
- [<item1>]
- [<item2>]
> 代码中如果出现了"不做清单"里的内容（如加了图片解析），这是范围蔓延，标记出来。

### 1. 优化点（明确推荐改）
- [ ] 文件:行号 + 现状 + 建议 + 收益

### 2. 没把握的地方（我不确定，PM 来定）
- [ ] 文件:行号 + 现状 + 我的担心
  - **方案A（推荐）**：<具体文字描述，PM 不需要额外查资料就能判断>
  - **方案B**：<具体文字描述>
  > ⚠️ 正文必须包含两方案的具体文字描述，不能只写标签。PM 拍板前需要先在正文里看到内容。

### 3. 风险点（知道但暂时没解）
- [ ] 文件:行号 + 风险描述 + 触发条件 + 缓解方案

### 4. 整体评价
- 整体质量：优/良/中/差
- 后续可优化方向
```

**PM 拍板**：
1. 全部修
2. 部分修（选哪些）
3. 暂不修（记入 backlog）
4. 改设计规范（PM 拍板）

## PM 必拍板事项（任意一条都停手，等确认）

- 需求边界 / 验收标准（阶段 1）
- 方案选型（阶段 2）
- schema 字段增删改
- 业务阈值 / 核心参数（如 28d → 7d）
- LLM prompt 的 persona / few-shot / hard rules
- UI 重要位置（整体前置 / 折叠 / badge / 颜色规则）
- 设计规范（docs/design-system.md）修改
- 删文件 / 引入新依赖
- 审查后的修复范围（阶段 5）

## 阶段快照交接文件

每个阶段完成后，更新 `STAGE_STATE.md`（后续 subagent 或未来的自己可以直接读取，不需要重新问 PM）：

```markdown
<!-- STAGE_STATE.md -->
## 当前阶段状态

stage: N
decided:
  - UI库=Ant Design
  - 后端框架=FastAPI+pandas
  - 图表库=Recharts
  - CSV路径=环境变量 CSV_DIR
pending:
  - PM 拍板中：时间戳解析用纯re还是dateutil
risk:
  - CSV不存在时返回404，前端需容错UI
not_doing:
  - 图片/语音/表情解析
  - 批量目录处理
  - Web UI
```

> 每次阶段报告后同步更新这个文件。subagent 接手时先读 STAGE_STATE.md。

阶段完成后，给 PM 的报告格式：

```
✅ 阶段 N 完成 · <任务名>

[执行摘要：1-3 句关键结论]

📋 产出：
- <文件/链接>

🚫 本次 MVP 不做：
- <明确列出来，防止范围悄悄蔓延>

⚠️ 风险点：
- <风险描述>

👉 PM 确认项：
- <具体拍板问题 + 选项 + 推荐>
```

> 🚫 "不做"清单在每个阶段报告中都必须出现。如果某阶段发现了新的"不做"项，立即加入。

## Failure handling

| 情况 | 做法 |
|---|---|
| PM 不认可当前阶段产出 | 回到该阶段，用 PM 的反馈重新做 |
| PM 想要不同方案 | 先列选项 + 推荐，PM 拍板后再推进 |
| PM 说"跳过流程直接做" | 尊重，直接做，不走 SOP |
| 开发中途 PM 改需求 | 停止当前子任务，更新需求文档，从阶段 1 继续 |
| PM 没回应拍板请求 | 等；不要自己选，等 PM 决定 |
| 流程走到一半发现更简单方案 | 报告 PM，建议降级，PM 同意后执行 |

## 工作流总图

```
用户提出 vibe-coding 任务
   ↓
[阶段 1] 需求确认 → PM 拍板：边界 + 验收标准 + 优先级
   ↓
[阶段 2] 技术评估 → PM 拍板：选哪个方案
   ↓
Git init（第一天）+ CHANGELOG 建立
   ↓
[阶段 3] 开发
   ↓   后端：api-and-interface-design + source-driven
   ↓   前端：frontend-ui-engineering + design-taste
   ↓   设计规范：docs/design-system.md（首次必出）
   ↓   增量交付：每步 commit + tag
   ↓   每步报告：执行思路 + 风险 + 建议
   ↓
[阶段 4] 测试 → 串行测试用例 + 回归用例库
   ↓
[阶段 5] 代码审查（commit≥20 或大版本前）→ PM 拍板修复范围
   ↓
持续迭代（回到阶段 3）
```
