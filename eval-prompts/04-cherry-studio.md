# Cherry Studio 评审指南 · vibe-coding-sop

> Cherry Studio 是开源多模型 AI 客户端(macOS/Windows/Linux),
> 核心优势:**一次跑多个模型对比** + **预设 prompt 库** + **本地对话历史**
> GitHub: https://github.com/CherryHQ/cherry-studio

## 为什么用 Cherry Studio(而不是开 3 个浏览器)

| 维度 | 开 3 个浏览器 | Cherry Studio |
|---|---|---|
| 切换对比 | 切 tab | **并排显示**,实时对比 |
| Prompt 复用 | 复制 3 次 | **预设助手**,一键调用 |
| 文件上传 | 每个 AI 各传 1 次 | **传 1 次,3 模型共用** |
| 对话存档 | 各自保存 | **本地统一存档** |
| 模型配置 | 网页登录 | **统一 API 配置,任意切换** |
| 离线用 | 不行 | **支持 Ollama 本地模型** |

---

## Step 1:安装 Cherry Studio

### macOS
```bash
# 方式 1:Homebrew(推荐)
brew install --cask cherry-studio

# 方式 2:官网下载
# https://cherry-ai.com/download
```

### Windows
- 官网下载安装包(同上)
- 或 `winget install cherry-studio`

### Linux
- AppImage / deb 包(见 GitHub Release)

---

## Step 2:配置 3 个 LLM

打开 Cherry Studio → **设置** → **模型服务** → 添加 3 个 provider:

### 2.1 OpenAI / ChatGPT(对应 `01-chatgpt.md`)
- **服务商**: OpenAI
- **API Key**: 你的 OpenAI Key
- **模型**: `gpt-4o` 或 `gpt-4-turbo`
- **Base URL**: 默认 `https://api.openai.com/v1`

> 如果用第三方代理(中转),改 Base URL 为代理地址

### 2.2 Anthropic Claude(对应 `02-claude.md`)
- **服务商**: Anthropic
- **API Key**: 你的 Claude Key
- **模型**: `claude-3-5-sonnet-20241022` 或更新的
- **Base URL**: 默认 `https://api.anthropic.com`

### 2.3 Google Gemini(对应 `03-gemini.md`)
- **服务商**: Gemini
- **API Key**: 你的 Google AI Studio Key
- **模型**: `gemini-1.5-pro-latest` 或 `gemini-2.0-flash`
- **Base URL**: 默认

> **国内用户提示**:3 个 provider 都支持自定义 Base URL,
> 如果用国内代理(如 oneapi / newapi),改 Base URL 即可

---

## Step 3:把 3 个 prompt 存为"助手"(Preset)

Cherry Studio 的"助手"功能 = 预设 prompt 库。

### 3.1 创建助手
- 左侧 **助手** → 右上 **+**
- 创建 3 个助手:

#### 助手 1: `vibe-coding-sop · ChatGPT 评审`
- **名称**: ChatGPT 评审
- **Prompt**(系统提示词):打开 `01-chatgpt.md`,把"```"之间的内容全部粘到"系统提示词"框
- **温度**: 0.3(评审要稳定,不要 creative)
- **最大输出**: 8000(7 维度 + 必改 3-5 条 + 整体评价,需要长输出)

#### 助手 2: `vibe-coding-sop · Claude 评审`
- 同上,用 `02-claude.md` 的 prompt
- **温度**: 0.3
- **最大输出**: 10000(Claude 输出更长)

#### 助手 3: `vibe-coding-sop · Gemini 评审`
- 同上,用 `03-gemini.md` 的 prompt
- **温度**: 0.3
- **最大输出**: 8000

### 3.2 上传 SOP 文件
- 在 **知识库** 或 **对话** 里,点附件 → 上传 `vibe-coding-sop-dist.zip`
- 或上传解压后的文件夹(更精细)

---

## Step 4:跑评审(3 种方式)

### 方式 A:开 3 个对话,各跑各的(最简单)
1. 新建对话 1 → 选助手"ChatGPT 评审"→ 问 "请评审" → 拿到结果
2. 新建对话 2 → 选助手"Claude 评审"→ 问 "请评审" → 拿到结果
3. 新建对话 3 → 选助手"Gemini 评审"→ 问 "请评审" → 拿到结果

### 方式 B:Battle Mode 同时跑 ⭐(推荐)
- 部分 Cherry Studio 版本支持"对比模式"
- 在对话界面勾选多个模型(2-4 个)
- 输入 prompt → 3 个模型同时回答 → **并排显示**
- 优点:节省时间,直接对比
- 注意:需要 3 个 provider 都配好,模型都支持上传 zip

### 方式 C:用代码跑(高级)
Cherry Studio 没直接开放 batch API,但你可以通过 API 调 3 个 provider,自己写脚本(略)

---

## Step 5:保存结果 + 对比

### 5.1 Cherry Studio 导出
- 每个对话 → 右上 **···** → **导出**
- 选 Markdown 格式
- 保存到 `eval-prompts/results/`:
  ```
  eval-prompts/
  ├── results/
  │   ├── chatgpt-eval-2026-07-23.md
  │   ├── claude-eval-2026-07-23.md
  │   └── gemini-eval-2026-07-23.md
  ```

### 5.2 写对比报告
按 `eval-prompts/README.md` 里的"对比分析"模板,新建 `comparison-2026-07-23.md`

### 5.3 出 v2 修改计划
按 README 里的"修改计划"模板,写 `v2-modification-plan.md`

---

## Cherry Studio 特有的坑

### 坑 1:prompt 长度超限
Cherry Studio 的"系统提示词"框可能有字数限制(看版本),如果超了:
- 用 **助手** 里的"提示词模板分段"功能
- 或把 SOP 内容作为**知识库**上传,在 prompt 里 @ 引用

### 坑 2:附件上传失败
- zip 文件可能超过单个 provider 的限制(OpenAI 50MB / Claude 100MB / Gemini 2GB)
- 我们的 zip 22KB,远低于限制,没问题

### 坑 3:Battle Mode 不可用
- 部分旧版 Cherry Studio 不支持对比模式
- 解决:升级到最新版 / 用方式 A(开 3 个对话)

### 坑 4:模型回复截断
- 评审输出可能很长,被截断
- 解决:追问"继续" / 提高最大输出 token

---

## Cherry Studio 高级玩法

### 玩法 1:本地模型对比
- 装 Ollama → 拉个本地模型(如 `qwen2.5:14b`)
- Cherry Studio 加 Ollama provider
- 本地模型评审不花钱,适合反复跑多次

### 玩法 2:对比历史存档
- Cherry Studio 本地保存所有对话
- 下次想重新评审,直接翻历史,不用重跑

### 玩法 3:协作
- Cherry Studio 支持导出对话为 Markdown
- 把 3 份结果 + 对比报告发给团队,大家讨论
- 或推到 GitHub,变成 PR review

---

## 5 步快速启动清单

- [ ] 安装 Cherry Studio(brew / 官网)
- [ ] 配置 3 个 LLM provider(OpenAI + Claude + Gemini)
- [ ] 创建 3 个助手,粘贴对应 prompt
- [ ] 上传 `vibe-coding-sop-dist.zip`
- [ ] 跑评审(方式 A 或 B),导出结果
- [ ] 写对比报告 + v2 修改计划

**预计总耗时**:20-30 分钟(Battle Mode 更快)

---

## 关联资源

- `01-chatgpt.md` / `02-claude.md` / `03-gemini.md` — 3 个评审 prompt
- `README.md` — 跨 AI 评审流程说明
- `vibe-coding-sop-dist.zip` — 待评审的 SOP 包
