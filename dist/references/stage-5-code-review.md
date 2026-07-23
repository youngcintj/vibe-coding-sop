# 阶段 5:定期代码审查(Code Review)

> ⚠️ **Skill Fallback 声明**:本文档引用的 `code-review-and-quality` / `code-simplification` / `doubt-driven-development` 等 skill 若不可用,**按本文档"报告模板" + "审查维度清单"内联执行**,不要因为缺 skill 就跳过本阶段。
> 注:`requesting-code-review` / `receiving-code-review` 的功能已合并进 `code-review-and-quality`。

## 目的

开发一段时间后,主动发现**可优化**、**自己没把握**、**已知风险**的点,让 PM 决定是否修缮。

## 触发条件

- 累计 commit ≥ 20
- 大版本(v0.X.0)发布前
- PM 主动要求
- 架构级变更后

## 必用 skill

| skill | 用途 |
|---|---|
| `code-review-and-quality` | 多维度审查(正确性 / 可读性 / 安全 / 性能 / 可维护) |
| `requesting-code-review` | 合并前自评 |
| `receiving-code-review` | 评估 review 反馈,逐条验证 |
| `code-simplification` | 简化代码不改行为 |
| `doubt-driven-development` | 对抗性审查,假设反面成立 |

## 报告模板(必出)

```markdown
# 代码审查报告 · [版本]

## 1. 优化点(明确推荐改)
- [ ] **文件:行号** + 现状 + 建议 + 收益
- 例:`src/api/user.py:42` - `get_user()` 没缓存,每次都查 DB
  - 建议:加 Redis 缓存(TTL 5min)
  - 收益:QPS 5x 提升

- [ ] ...

## 2. 没把握的地方(我不确定,你来定)
- [ ] **文件:行号** + 现状 + 我的担心 + 2 个方案
- 例:`src/utils/auth.py:18` - 我用了 jwt 过期时间 24h,但不确定是否够安全
  - 方案 A:保持 24h(用户体验好)
  - 方案 B:改 1h + refresh token(更安全)

- [ ] ...

## 3. 风险点(知道但暂时没解)
- [ ] **文件:行号** + 风险描述 + 触发条件 + 缓解方案
- 例:`src/db/migrations/0001_init.sql:25` - 没加索引,数据量超 100w 后会慢
  - 触发:新登用户 > 100w
  - 缓解:加索引 migration

- [ ] ...

## 4. 整体评价
- 整体代码质量评分:优 / 良 / 中 / 差
- 代码异味:... 处
- 重复代码:... 处
- 测试覆盖率:...%
- 后续可优化方向:...
```

## 拍板点(PM 决定)

- 全部修(我列的所有都修)
- 部分修(选哪些)
- 暂不修(记入 backlog)
- 改设计规范(影响所有 UI,要 PM 拍板)

## 工作流

```
累计 commit ≥ 20 或 PM 触发
   ↓
1. code-review-and-quality 多维度审查
   ↓
2. requesting-code-review 自评
   ↓
3. doubt-driven-development 对抗性审查
   ↓
4. 输出报告(优化 / 没把握 / 风险 三件套)
   ↓
5. PM 拍板
   ↓
6. 按拍板结果执行(或记入 backlog)
```

## 审查维度清单

**正确性**:
- 边界情况处理
- 异常路径
- 并发安全
- 数据一致性

**可读性**:
- 命名规范
- 函数长度
- 注释质量
- 魔法数字

**安全性**:
- 输入验证
- SQL 注入
- XSS / CSRF
- 鉴权 / 授权
- 敏感信息泄露

**性能**:
- N+1 查询
- 重复计算
- 内存泄漏
- 阻塞操作

**可维护性**:
- 重复代码
- 紧耦合
- 缺测试
- 文档缺失

## 跟阶段 3 的关系

- 阶段 3 增量交付时,**每个小功能 commit 前**自评(用 `requesting-code-review`)
- 阶段 5 是**整体回顾**,在阶段 3 的基础上做全局审查
- 阶段 5 发现的**结构性问题** → 回阶段 3 重构

## 检查清单

- [ ] 触发了(commit ≥ 20 / 大版本前 / PM 要求)
- [ ] 三件套都写了(优化 / 没把握 / 风险)
- [ ] 每条都有具体文件:行号
- [ ] 整体评价写了
- [ ] PM 拍板了
- [ ] 拍板结果执行了 / 记入 backlog

## 反模式

- ❌ 只说"代码整体不错"(没具体证据)
- ❌ 列 50 个优化点让 PM 决策疲劳(挑重要的 5-10 个)
- ❌ 没拍板就修(违反 SOP 阶段 3 拍板点)
