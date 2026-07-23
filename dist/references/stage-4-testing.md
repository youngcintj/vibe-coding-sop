# 阶段 4:测试(Testing)

> ⚠️ **Skill Fallback 声明**:本文档引用的 `code-test-expert` / `test-driven-development` / `verification-before-completion` / `browser-testing-with-devtools` / `dispatching-parallel-agents` 等 skill 若不可用,**按本文档"必跑硬规则" + 内联指令执行**,不要因为缺 skill 就跳过本阶段。

## 目的

让用户**按顺序点完一遍**,快速确认主功能按需求工作;AI 不靠 LLM 自检完成度。

## 必用 skill

| skill | 用途 |
|---|---|
| `code-test-expert` | 测试方案设计与执行,覆盖功能 / 性能 / 安全 / 兼容性 |
| `test-driven-development` | TDD(先写失败测试,再写最少代码) |
| `verification-before-completion` | 完成前必验证,不靠 LLM 自检 |
| `browser-testing-with-devtools` | Chrome DevTools MCP 真浏览器测 |
| `dispatching-parallel-agents` | 并行跑多端验证(prototype ↔ 调试控制台) |

## 必跑硬规则(无论 skill 是否可用)

以下动作必做,**不依赖任何 skill**:

- [ ] **Playwright / curl 实测** — 不是 LLM 自检("我看了代码,应该没问题"不算)
- [ ] **串行测试用例 ≤ 10 条** — 用户按顺序点完,不用思考测试路径
- [ ] **每条用例有"预期 + 实际"两栏** — 模糊的验收不算
- [ ] **不通过有具体反馈** — 截图 + 错误信息 + 复现步骤
- [ ] **回归用例库** — 每次大改前必跑核心用例
- [ ] **覆盖功能 / 边界 / 性能 / 兼容性** — 不是只测主流程

即使 `code-test-expert` / `verification-before-completion` / `browser-testing-with-devtools` / `dispatching-parallel-agents` 全部不可用,以上规则仍然必走——这是 SOP 不可妥协的硬规则。

## 工作流

```
单功能开发完毕(阶段 3)
   ↓
1. code-test-expert 写测试计划
   ↓
2. 写串行测试用例(模板见下)
   ↓
3. 用户按顺序点完一遍
   ↓
4. 不通过的 → 回 阶段 3 修
   ↓
5. 都通过 → 进 阶段 5(累计 commit ≥ 20 时)
```

## 输出 1:测试计划

```markdown
# 测试计划:[功能名]

## 范围
- 功能: ...
- 涉及文件: ...

## 测试维度
- [ ] 功能测试(主流程)
- [ ] 边界测试(空值 / 极值 / 异常输入)
- [ ] 性能测试(响应时间 / QPS)
- [ ] 兼容性测试(浏览器 / 设备)
- [ ] 安全测试(注入 / XSS / 鉴权)

## 不测什么
- ...(明确范围,防止范围蔓延)
```

## 输出 2:串行测试用例(⭐ 用户的核心需求)

**目的**:用户按顺序点完一遍,快速确认主功能。

**模板**:

```markdown
# 串行测试用例:[功能名]

## 准备
- 启动:[命令]
- 访问:[URL]
- 测试账号:[xxx] / 密码:[向 PM 索要]

## 用例(按顺序)

### 用例 1:[场景]
- **步骤**:
  1. 在 X 页面点击 Y 按钮
  2. 在弹窗中输入 Z
  3. 点击"提交"
- **预期**:页面跳转到 W,显示 V 结果
- **实际**:✅ / ❌(用户填)
- **如果不通过**:截图 + 错误信息

### 用例 2:[场景]
- **步骤**:
  1. ...
- **预期**:...
- **实际**:...

## 回归用例库
- (每个大改前必跑的核心用例)
```

**关键要求**:
- ✅ 用户按顺序点完一遍就行,不用思考测试路径
- ✅ 每步有明确"通过/不通过"标准
- ✅ 不通过时给具体反馈(截图 + 错误信息)
- ❌ 不要让用户自己设计测试路径
- ❌ 不要一次性扔 20 条给用户

## 验证手段(用 skill)

| 验证类型 | 工具 / 方式 |
|---|---|
| Web 页面 | `browser-testing-with-devtools` (Chrome DevTools MCP) |
| API | `curl` / Postman / HTTPie |
| 单元测试 | pytest / jest / vitest |
| 端到端 | Playwright / Cypress |
| 性能 | k6 / ab / wrk |
| 多端对比 | `dispatching-parallel-agents`(同时跑多个 agent) |

## 拍板点

- 测试范围(全测还是只测主流程)
- 不通过时的修复优先级

## 检查清单

- [ ] 测试计划覆盖功能 / 边界 / 性能 / 兼容性
- [ ] 串行测试用例 ≤ 10 条
- [ ] 每条用例有明确"预期" + "实际"两栏
- [ ] 用户能按顺序点完一遍
- [ ] 不通过的用例有具体反馈
- [ ] 回归用例库建好

## 反模式

- ❌ "我已经测过了,应该没问题"(LLM 自检不算)
- ❌ 一次性给用户 50 条用例
- ❌ 验收标准模糊("功能正常" / "看起来 OK")
- ❌ 测完不写报告,只说"通过"
