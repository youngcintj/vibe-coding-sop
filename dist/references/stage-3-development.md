# 阶段 3:开发(Development)

> ⚠️ **Skill Fallback 声明**:本文档引用的 `api-and-interface-design` / `source-driven-development` / `security-and-hardening` / `frontend-ui-engineering` / `design-taste-frontend` / `impeccable` / `design-is` / `UI Design Master` / `arco-design` / `senior-fullstack` / `debugging-and-error-recovery` / `observability-and-instrumentation` / `incremental-implementation` 等 skill 若不可用,**按本文档"抗 AI Slop 自检清单" + 各小节内联指令执行**,不要因为缺 skill 就跳过本阶段。

## 目的

按后端 + 前端 + 设计规范 3 个子阶段推进,**增量交付**,每步可运行。

## 3.0 Git 初始化(强制,第一件事)

**用 skill**:`git-workflow-and-versioning`

```bash
# 项目第一天
git init
# 写 .gitignore(必含:.env / .bak / __pycache__ / node_modules / dist / .DS_Store)
git add .
git commit -m "chore: init project"
```

**强制规则**:
- 大变更 → 单独 commit + `git tag v0.X.0`(semver)
- 回滚 → `git checkout <tag> -- <path>`,不靠文件备份 + regex 删
- 删文件 → 可恢复删除工具(`mavis-trash` Mavis 生态 / `trash-cli` 跨平台 / 系统回收站),绝不 `rm -rf`

---

## 3.1 后端开发

**用 skill**:

| skill | 用途 |
|---|---|
| `api-and-interface-design` | 设计稳定、难误用的 API 和接口 |
| `source-driven-development` | 框架相关决策以官方文档为依据,禁止凭记忆 |
| `security-and-hardening` | 输入验证 / 认证 / 数据存储 / 第三方集成审查 |
| `senior-fullstack` | 脚手架参考(Next.js / FastAPI / MERN / Django) |
| `debugging-and-error-recovery` | 报错时系统化根因,不靠试 |
| `observability-and-instrumentation` | 日志 / 指标 / 追踪 / 告警 |

**工作流**:
1. 用 `api-and-interface-design` 设计 API 契约(类型 + 边界)
2. 用 `source-driven-development` 查官方文档,不凭记忆
3. 用 `senior-fullstack` 选脚手架
4. 写代码 + 用 `security-and-hardening` 审查
5. 报错用 `debugging-and-error-recovery` 定位,不靠 try-error
6. 生产前用 `observability-and-instrumentation` 加可观测性

**拍板点**:
- 改 schema(字段增删改 / API 契约)
- 改业务规则阈值 / 核心参数
- 改 .env 兜底 / 鉴权 / 安全相关
- 引入新依赖

---

## 3.2 前端开发

**用 skill**:

| skill | 用途 |
|---|---|
| `frontend-ui-engineering` | 生产级 UI(组件/响应式/无障碍/状态管理/组件测试) |
| `design-taste-frontend` | Anti-slop(避免 AI 通用设计感) |
| `impeccable` | 设计/审计/优化 |
| `design-is` | Dieter Rams 十项设计原则 |
| `UI Design Master` | 配色/动效/响应式 |
| `arco-design` / `arco-design-vue` | 组件库参考(按栈) |

**工作流**:
1. 用 `frontend-ui-engineering` 设计组件结构
2. 用 `design-taste-frontend` 抗 AI slop
3. 用 `UI Design Master` 配色 + 动效
4. 用 `design-is` 做原则审查
5. 用 `impeccable` 整体审计

**拍板点**:
- 改 UI 信息层级 / 重要 layout / 重要文案
- 改前端 public API

---

## 3.2.5 抗 AI Slop 自检清单(替代 design-taste-frontend / impeccable / design-is / UI Design Master / arco-design)

**当上述 5 个 skill 全部不可用时,按本清单自检**。这个清单提炼了抗 AI slop 的核心规则:

```markdown
### 抗 AI Slop 自检清单(每个前端功能交付前必跑)

#### 配色
- [ ] 主色不超过 1 个(主操作/链接/强调)
- [ ] 辅色不超过 2 个(次要/中性)
- [ ] 语义色齐全(成功/警告/错误/信息,各 1 个)
- [ ] 中性色 5-9 级(50/100/.../900)
- [ ] **不用默认渐变**(linear-gradient 慎用,顶多 2 处)
- [ ] **不用默认阴影**(box-shadow 简化,1-2 级)

#### 排版
- [ ] **不用居中大标题**(左对齐 + 字重分级:H1 600 / H2 500 / Body 400)
- [ ] 字号 5-7 档(不要 12+ 种字号)
- [ ] 行高合理(标题 1.2-1.3 / 正文 1.5-1.6)
- [ ] 不用 emoji 滥用(每个 section 最多 1 个,关键 CTA 不用)

#### 间距 / 圆角
- [ ] 间距用 4 的倍数(4/8/12/16/24/32/48)
- [ ] 圆角统一(选 1-2 个值:小 4 / 中 8,不要混用)
- [ ] 不要每张卡片都不同圆角

#### 交互
- [ ] 暗色模式可读(对比度 ≥ 4.5:1)
- [ ] 移动端不破版(max-width 100% / flex 1)
- [ ] 空状态有说明(不是空白,要有 icon + 文案 + 行动)
- [ ] 加载状态有反馈(skeleton / spinner / 进度条)
- [ ] 错误状态有恢复路径(不只是"出错了")

#### 反 AI 套路(绝对不要)
- [ ] ❌ 紫色渐变 + 居中大标题 + emoji 三件套
- [ ] ❌ "100% 安全 / 业界领先"这种空话
- [ ] ❌ "立即开始 / 立即试用" 满屏都是
- [ ] ❌ 3D 插画 + 抽象图形当主视觉
- [ ] ❌ 动效过长(> 500ms 让人等)
```

**使用时机**:
- 每个新前端功能 commit 前 → 跑一遍这个清单
- 大改前端样式后 → 跑一遍
- 评审代码时(阶段 5)→ 作为审查维度之一

---

## 3.3 设计规范沉淀(关键!)

**目的**:保证每次后续开发都同一套风格,避免"每个新功能长得不一样"。

**必出**:`docs/design-system.md`(第一个功能时必出,后续可增量更新)

**必含**:

```markdown
# 设计规范 [项目名]

## 配色
- 主色:#xxxxxx(主操作 / 链接 / 强调)
- 辅色:#xxxxxx(次要操作)
- 语义色:
  - 成功:#xxxxxx
  - 警告:#xxxxxx
  - 错误:#xxxxxx
  - 信息:#xxxxxx
- 中性色:9 级(50/100/.../900)

## 字号 / 字重 / 行高
- H1: 32px / 600 / 1.2
- H2: 24px / 600 / 1.3
- H3: 20px / 500 / 1.4
- Body: 16px / 400 / 1.5
- Small: 14px / 400 / 1.5
- Caption: 12px / 400 / 1.4

## 间距(4 的倍数)
- xs: 4
- sm: 8
- md: 12
- lg: 16
- xl: 24
- 2xl: 32
- 3xl: 48

## 圆角
- 小: 4
- 中: 8
- 大: 12
- 圆: 9999

## 阴影
- sm: 0 1px 2px rgba(0,0,0,.05)
- md: 0 4px 6px rgba(0,0,0,.07)
- lg: 0 10px 15px rgba(0,0,0,.10)

## 组件风格
- button: 主色 / 次色 / 文字 / 危险 / 禁用 5 种
- card: 圆角 + 阴影 + 内部间距
- modal: 居中 / 背景遮罩 / ESC 关闭
- toast: 顶部 3s 自动消失

## 动效
- 缓动:cubic-bezier(0.4, 0, 0.2, 1)
- 短动效:150ms
- 中动效:300ms
- 长动效:500ms

## 暗色模式(可选)
- 配色对照
- 切换策略
```

**使用规则**:
- 每个新功能开发前 **先 grep 设计规范**
- 改设计规范要 PM 拍板(影响所有现有 UI)

---

## 3.4 增量交付

**用 skill**:`incremental-implementation`

**原则**:
- 每完成小功能 → commit
- 大变更(影响 ≥3 文件)→ 单独 commit + tag
- 每步可运行,不攒一堆一起提交

**示例 commit 信息**:
```
feat(user): 新增用户注册接口
fix(login): 修复空指针异常
docs(design): 补充暗色模式配色
chore(deps): 升级 FastAPI 到 0.110
refactor(api): 抽取公共校验逻辑
```

---

## 跨阶段产物(每步必给)

```markdown
## [阶段 3.1/3.2/3.3/3.4] 执行报告

### 执行思路
- 做了什么(具体文件 + 改动)
- 怎么做的(关键决策 + 替代方案)
- 关键决策(为什么这么选)

### 风险点
- 可能踩的坑
- 边界情况
- 已知问题

### 后续建议
- 下一步可做什么
- 类似项目怎么借鉴
```

## 检查清单

- [ ] Git 初始化(.gitignore / 第一次 commit)
- [ ] 设计规范 docs/design-system.md 已出
- [ ] 后端 API 契约文档化
- [ ] 前端组件风格统一
- [ ] 每完成小功能都 commit
- [ ] 大变更打了 tag
- [ ] 给了执行报告
