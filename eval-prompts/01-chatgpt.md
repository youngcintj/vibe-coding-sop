# 评审 Prompt · ChatGPT 专用

> 用法:复制本文件全部内容 → 打开 ChatGPT → 新对话 → 粘贴 → 上传 `vibe-coding-sop-dist.zip`
> 适用: ChatGPT-4o / GPT-4 Turbo / GPT-5 系列

---

```
你是一个 skill 设计评审专家,精通 developer experience 和 process design。

## 评审目标
评审这个 vibe-coding SOP skill 包:
- 5 个阶段(需求确认/技术评估/开发/测试/代码审查)
- 4 个横向要求(执行思路/风险/建议/强制 Git)
- 6 维技术评估矩阵(功能 30/熟悉度 20/性能 15/维护 15/生态 10/成本 10)
- 4 种分发格式(SKILL.md / .cursorrules / CLAUDE.md / system-prompt-block)
- 5 份阶段详细文档(references/stage-1 ~ stage-5)

## 待评审材料
[附件: vibe-coding-sop-dist.zip,包含 SKILL.md / README.md / .cursorrules / CLAUDE.md / package.json / prompts/system-prompt-block.md / references/*.md]

## 评审要求:证据驱动 + 可复查(重量级)
每条评价必须满足:
1. **引用文件:行号**(例:`SKILL.md:42` 或 `references/stage-3-development.md:18-22`)
2. **引原文片段**(≤ 30 字,放在引号里)
3. **指出问题**(具体,不是"可以更好")
4. **给修改建议**(具体到怎么改)

## 7 维度评分(每维度 1-10)

| 维度 | 评估点 |
|---|---|
| 1. 完整性 | 5 阶段/4 横向/6 维/拍板点都覆盖了吗?有没有关键遗漏? |
| 2. 可执行性 | 每个阶段动作具体吗?还是停留在"做好需求"这种废话? |
| 3. 可拍板性 | PM 拍板点明确吗?有具体问什么吗? |
| 4. 可量化 | 有检查清单 / 反模式吗?能客观判断"做没做"吗? |
| 5. 可适配 | 不适用场景 / 边界条件写了吗?能处理例外吗? |
| 6. 文档质量 | references/ 详细吗?SKILL.md 简洁吗?README 完整吗? |
| 7. 跨工具兼容 | 4 种分发格式完整吗?Cursor/Claude Code/网页 LLM 都能用吗? |

## 输出格式(严格遵守 JSON 结构 + Markdown 报告)

```json
{
  "overall_score": X/10,
  "dimension_scores": {
    "completeness": X/10,
    "executability": X/10,
    "decision_points": X/10,
    "quantifiability": X/10,
    "adaptability": X/10,
    "doc_quality": X/10,
    "cross_tool_compat": X/10
  },
  "must_fix": [
    {
      "file": "SKILL.md",
      "line": 42,
      "quote": "原文片段",
      "problem": "具体问题",
      "fix": "具体修改建议",
      "impact": "改完的收益"
    }
  ],
  "should_fix": [...],
  "nice_to_have": [...]
}
```

最后给一段 **300 字以内的整体评价**(用 Markdown 列表,不要长篇大论)。

## 关键原则
- ❌ 不要说"可以更好" / "建议完善" / "考虑增加" — 这种空话不算评价
- ❌ 不要给"如果不引用就当没看到"的评价 — 必须引文件:行号
- ❌ 不要列 10+ 条"必改"— 挑最关键的 3-5 条
- ✅ 给"具体场景下的具体问题"(例:"在 Cursor 0.40 版本,.cursorrules 已被 .cursor/rules/*.mdc 取代")
- ✅ 给"可执行的修改建议"(例:"把 'try to ensure' 改成 'must'",而不是"加强语气")
```

---

## 用法步骤

1. **下载附件**:用 `vibe-coding-sop-dist.zip`(已经在工作区)
2. **打开 ChatGPT**:https://chatgpt.com/
3. **新对话**:点 "New chat"
4. **粘贴 prompt**:把上面"```"之间的内容全部粘贴
5. **上传 zip**:点附件图标 → 上传 `vibe-coding-sop-dist.zip`
6. **发送**:按 Enter
7. **保存结果**:ChatGPT 回复后,复制整个 JSON + 文字评价,保存为 `chatgpt-eval-2026-07-23.md`

## 注意事项

- 如果 ChatGPT 一次说不完,会分多次回复,**让它继续**("continue" / "go on")
- 如果回复太短/太敷衍,追问"按 7 维度重新打分,每维度给至少 2 条证据"
- 如果回复幻觉(说文件不存在/行号错),**当场验证**:自己打开对应文件看行号对不对

## 结果保存建议

```
eval-prompts/
├── results/
│   ├── chatgpt-eval-2026-07-23.md  ← 你这次的结果
│   ├── claude-eval-2026-07-23.md
│   └── gemini-eval-2026-07-23.md
└── comparison-2026-07-23.md  ← 你对比 3 份后写的总结
```
