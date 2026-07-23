# Vibe-Coding SOP v1

**适用范围**:用户(数据部门 PM)给 AI 派"写代码类"任务时,统一按这个流程走。
**生成日期**: 2026-07-23
**状态**: 待用户确认

---

## 核心目标(5 个阶段 + 4 个横向要求)

### 5 个阶段
1. **需求确认** - skill 深度访谈,不是简单"听懂"
2. **技术评估** - 多维矩阵,推荐方案 + 备选
3. **开发** - 后端逻辑可靠 / 前端审美在线 / 设计规范沉淀
4. **测试** - 测试计划 + 串行测试用例
5. **代码审查** - 定期,优化点 + 没把握点,PM 拍板

### 4 个横向要求(贯穿每个阶段)
- **A. 每步给用户详细执行思路解释**
- **B. 瓶颈风险点标注**
- **C. 后续开发建议**
- **D. 强制 Git 版本控制**(项目第一天 git init,大变更打 tag,回滚用 `git checkout <tag>`)

---

## 阶段 1:需求确认

### 主 skill
- `brainstorming` - 协作式需求探索
- `interview-me` - 逐一提问挖掘用户真正想要的
- `idea-refine` - 打磨清晰概念

### 辅助 skill
- `plan-mode` - 关键决策先讨论,不直接动手
- `spec-driven-development` - 写代码前结构化规格

### 输出
1. **需求规格说明**(含验收标准)
2. **执行思路**:任务拆解 + 关键路径
3. **风险点**:歧义点 / 范围蔓延点 / 隐藏依赖
4. **后续建议**:技术选型方向 / 类似项目参考

### 拍板点
- 需求边界(明确"不做"什么)
- 验收标准(用户用得顺的具体行为)
- 优先级(MVP vs 完整版)

---

## 阶段 2:技术评估(必做,不可跳过)

### 主 skill
- `tech-stack-evaluator` - 技术栈评估和比较
- `doubt-driven-development` - 对抗性审查技术决策

### 技术评估矩阵(6 维)

| 维度 | 权重 | 评估项 |
|---|---|---|
| 功能匹配 | 30% | 是否覆盖所有需求场景 |
| 团队熟悉度 | 20% | 团队是否已有经验,上手成本 |
| 性能/可扩展 | 15% | 当前 + 未来 6 个月的承载能力 |
| 维护性 | 15% | 文档/社区活跃度/breaking change 频率 |
| 生态/集成 | 10% | 与现有系统的对接成本 |
| 长期成本 | 10% | 训练/LLM 推理/服务器/人力 |

### 输出
- **推荐方案** + 1-2 个备选
- 每个方案的:优势 / 劣势 / 风险 / 适配场景
- **PM 拍板**才进开发

---

## 阶段 3:开发(核心)

### 3.0 Git 初始化(强制,第一件事)
- 主 skill: `git-workflow-and-versioning`
- 辅助: `using-git-worktrees`(复杂功能用 worktree 隔离)
- **强制规则**:
  1. 项目第一天 `git init` + 写好 `.gitignore`(.env / .bak / __pycache__ / node_modules 必 ignore)
  2. **大变更必打 tag**(semver v0.X.0 / v0.X.Y)
  3. **回滚优先用 `git checkout <tag> -- <path>`**,不依赖文件备份
  4. 涉及 schema/阈值/UI 重要位置 → 走 `CHANGELOG.md` append-only 记录

### 3.1 后端开发
- 主 skill: `api-and-interface-design` - 设计稳定难误用的 API
- 辅 skill:
  - `source-driven-development` - 官方文档驱动(不凭记忆编码)
  - `security-and-hardening` - 输入验证/认证/数据存储审查
  - `senior-fullstack` - 脚手架参考(FastAPI/Django/Next.js)
  - `systematic-debugging` - 报错时系统化根因
  - `observability-and-instrumentation` - 日志/指标/追踪

### 3.2 前端开发
- 主 skill:
  - `frontend-ui-engineering` - 生产级 UI(组件/响应式/无障碍/状态管理)
  - `design-taste-frontend` - 抗 AI slop
- 辅 skill:
  - `impeccable` - 设计/审计/优化
  - `design-is` - Dieter Rams 十项原则
  - `UI Design Master` - 配色/动效/响应式
  - `arco-design` / `arco-design-vue`(如果用 Arco)

### 3.3 设计规范沉淀(关键!)
- **目的**:保证每次后续开发都同一套风格
- **沉淀产物**:`docs/design-system.md`(必出)
  - 配色(主色/辅色/语义色)
  - 字号/字重/行高
  - 间距体系(4/8/12/16/24/32)
  - 圆角/阴影/边框
  - 组件风格(button / card / modal / toast)
  - 动效曲线
  - 暗色模式
- 每次新功能开发前 **先 grep 设计规范**;改设计规范要 PM 确认

### 3.4 增量交付
- 主 skill: `incremental-implementation` - 每步产出可运行代码
- 辅 skill: `executing-plans` - 按计划执行,每步检查点
- 原则:**每完成一个小功能就 commit,不要攒一堆一起提交**

### 3.5 跨阶段产物(每步)
- **执行思路**:这次改了什么 / 怎么改的 / 为什么这么改
- **风险点**:可能踩的坑 / 边界情况
- **后续建议**:下一步可以做什么 / 类似项目怎么借鉴

---

## 阶段 4:测试

### 主 skill
- `code-test-expert` - 测试工程专家
- `test-driven-development` - TDD(先写失败测试)

### 辅助
- `verification-before-completion` - 完成前必验证,不靠 LLM 自检
- `browser-testing-with-devtools` - 真浏览器测 DOM/控制台/网络/性能
- `dispatching-parallel-agents` - 并行跑多端验证(prototype ↔ 调试控制台)

### 产物
1. **测试计划**(覆盖功能/性能/兼容性/异常路径)
2. **串行测试用例** ⭐(用户的核心需求)
   - 顺序执行,每步有明确"通过/不通过"标准
   - 用户可以快速按顺序点完一遍,确认主功能按需求工作
   - 不要让用户自己设计测试路径
3. **回归用例库**(每次大改前必跑)

---

## 阶段 5:定期代码审查(开发一段时间后必做)

### 触发条件
- 累计 commit 数 ≥ 20
- 或者大版本(v0.X.0)发布前
- 或者用户主动要求

### 主 skill
- `code-review-and-quality` - 多维度(正确性/可读性/安全/性能/可维护)
- `requesting-code-review` - 合并前自评
- `receiving-code-review` - 评估 review 反馈
- `code-simplification` - 简化代码不改行为
- `doubt-driven-development` - 对抗性审查

### 审查维度(给用户的报告模板)
```
## 代码审查报告 · v0.X.0

### 1. 优化点(明确推荐改)
- [ ] 文件:行号 + 现状 + 建议 + 收益

### 2. 没把握的地方(我不确定,你来定)
- [ ] 文件:行号 + 现状 + 我的担心 + 2 个方案

### 3. 风险点(知道但暂时没解)
- [ ] 文件:行号 + 风险描述 + 触发条件 + 缓解方案

### 4. 整体评价
- 整体代码质量评分(优/良/中/差)
- 后续可优化方向
```

### 拍板
- 用户看完报告,决定:
  1. 全部修
  2. 部分修(选哪些)
  3. 暂不修(记入 backlog)
  4. 改设计规范(要 PM 拍板)

---

## 横向要求:技术评估矩阵(集成进阶段 2)

评估矩阵不只用在阶段 2,每个关键技术决策点(框架/库/方案)都要走这个矩阵。

### 使用时机
- 选后端框架
- 选前端框架/UI 库
- 选数据库
- 选 LLM
- 选部署方案
- 选第三方 API/SaaS

---

## 横向要求:每步给用户报告(强制)

### 必含 3 部分
1. **执行思路**:做了什么 / 怎么做的 / 关键决策
2. **风险点**:可能踩的坑 / 边界情况 / 已知问题
3. **后续建议**:下一步建议 / 类似项目怎么借鉴

### 报告时机
- 阶段 1-5 每次完成 → 报告
- 大变更(影响 ≥3 个文件)→ 报告
- 发现潜在风险 → 立即报告(不等阶段结束)

### 报告格式
- **简短**(关键决策 + 风险 + 建议)
- **不啰嗦**(用 bullet,不写流水账)
- **可拍板**(明确给 PM 选项 + 我的推荐)

---

## 横向要求:Git 版本控制(强制,不可绕过)

### 主 skill
- `git-workflow-and-versioning` - 规范化 git 工作流
- `finishing-a-development-branch` - 测试通过后引导集成(merge/PR/清理)
- `using-git-worktrees` - 大功能用 worktree 隔离

### 强制规则
1. **项目启动第一天**:`git init` + 写 `.gitignore` + 第一次 commit
2. **每次大变更**(新增模块/大改 API/大改 UI)→ 单独 commit + 打 tag
3. **回滚优先 git**,不依赖文件备份 + regex 删(踩过的坑)
4. **不删文件不靠 `rm -rf`**,用 `mavis-trash`(可恢复)
5. **每次 commit 必带 CHANGELOG 同步更新**

---

## 整个工作流总图

```
用户提出 vibe-coding 任务
   ↓
[阶段 1] 需求确认 (brainstorming + interview-me)
   ↓      → 需求规格 + 验收标准
   ↓
[阶段 2] 技术评估 (tech-stack-evaluator)
   ↓      → 技术评估矩阵 + 推荐方案
   ↓
Git 初始化 (git-workflow-and-versioning)
   ↓
[阶段 3] 开发
   ↓   后端: api-and-interface-design + source-driven-development
   ↓   前端: frontend-ui-engineering + design-taste-frontend
   ↓   设计规范: docs/design-system.md(首次必出)
   ↓   增量提交: incremental-implementation
   ↓      → 每步: 执行思路 + 风险 + 建议
   ↓
[阶段 4] 测试
   ↓   code-test-expert → 测试计划
   ↓   → 串行测试用例(用户按顺序点完一遍)
   ↓
[阶段 5] 定期代码审查
   ↓   code-review-and-quality → 报告(优化/没把握/风险)
   ↓   → PM 拍板是否修缮
   ↓
持续迭代(回 阶段 3)
```

---

## 待用户确认的 3 个点

1. **流程大方向 OK 吗**?哪个阶段要加/去/合并?
2. **每个阶段配的 skill 对吗**?有没有想换/想加的?
3. **技术评估矩阵的 6 个维度** + **权重**合理吗?PM 视角下是不是有要调的?

确认后我会把整套流程写入 User Memory,以后 vibe-coding 任务自动按这个走。
