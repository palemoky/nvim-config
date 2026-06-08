# LazyVim

`<leader>` 就是空格，记不住按键按空格查看。



## 一、插件管理

| 操作                    | 命令                                        |
| ----------------------- | ------------------------------------------- |
| 打开插件管理面板        | `:Lazy`                                     |
| 更新所有插件            | `:Lazy update`(面板里按 `U`)                |
| 安装缺失插件            | `:Lazy install`(面板里按 `I`)               |
| 同步(装+删+更)          | `:Lazy sync`(面板里按 `S`)                  |
| 查看启动耗时            | `:Lazy profile`                             |
| 健康检查(排查问题)      | `:checkhealth`                              |
| 安装/管理 LSP、格式化器 | `:Mason`                                    |
| 更新 LazyVim 本体       | `:LazyExtras`(管理功能扩展)+ `:Lazy update` |

> 在 `:Lazy` 面板里按 `?` 看所有快捷键,按 `q` 退出。

---

## 二、常用插件一览

### LazyVim 默认核心插件(开箱即用)

| 插件                        | 作用                                                         |
| --------------------------- | ------------------------------------------------------------ |
| lazy.nvim                   | 插件管理器(`:Lazy`)                                          |
| snacks.nvim                 | 全家桶:启动页 / picker / 通知 / 终端 / LazyGit 集成 / 图片预览 |
| which-key.nvim              | 按键提示菜单(按 `<leader>` 停住会自动弹)                     |
| neo-tree.nvim               | 左侧文件树(`<leader>e`)                                      |
| snacks picker               | 模糊查找文件 / 内容(LazyVim 默认已替代 telescope)            |
| nvim-treesitter             | 语法高亮 / 缩进 / 结构化选区                                 |
| nvim-lspconfig + mason.nvim | LSP 跳转/补全/诊断；Mason 负责装语言服务器                   |
| blink.cmp                   | 自动补全引擎                                                 |
| conform.nvim                | 代码格式化(`<leader>cf`)                                     |
| nvim-lint                   | 异步 linter(代码/拼写检查)                                   |
| gitsigns.nvim               | 行内 git 标记 + hunk 暂存/预览                               |
| mini.pairs / surround / ai  | 自动括号 / 环绕符号 / 增强文本对象                           |
| flash.nvim                  | 闪电跳转(按 `s` + 字符)                                      |
| trouble.nvim                | 诊断 / 引用集中列表面板                                      |
| grug-far.nvim               | 项目级搜索替换(`<leader>sr`)                                 |
| todo-comments.nvim          | 高亮 `TODO` / `FIX` / `NOTE` 等标记                          |
| lualine.nvim                | 底部状态栏                                                   |
| bufferline.nvim             | 顶部 buffer 标签栏                                           |
| noice.nvim                  | 命令行 / 通知 / 弹窗 UI 美化                                 |
| tokyonight.nvim             | 配色方案(你设的是 `moon` 风格)                               |

### 额外添加的插件(`lua/plugins/`)

| 插件               | 配置文件               | 作用                                 |
| ------------------ | ---------------------- | ------------------------------------ |
| codecompanion.nvim | `codecompanion.lua`    | AI 聊天 / CLI(接 Claude Code)        |
| yazi.nvim          | `yazi.lua`             | 终端文件管理器(`<leader>-`)          |
| toggleterm.nvim    | `toggleterm.lua`       | 浮动 / 分屏终端(`Ctrl+\`)            |
| treesj             | `treesj.lua`           | 一键拆分 / 合并代码块(`<leader>m`)   |
| autolist.nvim      | `markdown-writing.lua` | Markdown 列表自动续行 / 编号         |
| vim-table-mode     | `markdown-writing.lua` | Markdown 表格自动对齐(`<leader>tm`)  |
| crates.nvim        | `rust.lua`             | `Cargo.toml` 依赖版本提示 / 补全     |
| rustaceanvim       | `rust.lua`             | Rust 增强 LSP(rust-analyzer + 调试)  |
| rest.nvim          | `rest.lua`             | 在编辑器里发 HTTP 请求(`.http` 文件) |

---

## 三、常用快捷键速查(LazyVim 默认)

### 文件 / 查找

| 键                          | 作用                      |
| --------------------------- | ------------------------- |
| `<leader>e`                 | 打开/关闭文件树(neo-tree) |
| `<leader>ff`                | 查找文件(按文件名)        |
| `<leader>fg` 或 `<leader>/` | 全局搜索文件内容(grep)    |
| `<leader>fr`                | 最近打开的文件            |
| `<leader>,`                 | 在已打开的 buffer 间切换  |
| `<leader><space>`           | 查找文件(快捷版)          |

### neo-tree
| 键                          | 作用                      |
| --------------------------- | ------------------------- |
| `a` | 新建文件/目录 |
| `A` | 新建目录 |
| `c` | 直接复制文件到指定路径 |
| `m` | 移动文件 |
| `y` | 复制文件 |
| `x` | 剪切文件 |
| `p` | 粘贴文件 |
| `r` | 重命名文件 |
| `d` | 删除文件 |
| `T` | 把文件移到回收站，而不是永久删除 |
| `z` | 折叠所有目录 |
| `h` / `l` | 折叠/展开目录（打开文件） |
| `H` | 显示/隐藏 `.` 文件 |

### Buffer / 窗口(分屏)

| 键                    | 作用                       |
| --------------------- | -------------------------- |
| `Shift+h` / `Shift+l` | 上一个 / 下一个 buffer     |
| `<leader>bd`          | 关闭当前 buffer            |
| `<leader>bp`          | 固定(pin)当前 buffer       |
| `<C-w>s` / `<C-w>v`   | 水平 / 垂直分屏            |
| `<C-h/j/k/l>`         | 在分屏窗口间跳转(左下上右) |
| `<C-w>q`              | 关闭当前窗口               |

### 代码 / LSP(光标停在符号上)

| 键           | 作用                          |
| ------------ | ----------------------------- |
| `gd`         | 跳到定义                      |
| `gr`         | 查找所有引用                  |
| `K`          | 悬浮显示文档/类型             |
| `<leader>ca` | 代码操作(快速修复/重构)       |
| `<leader>cr` | 重命名变量(全局)              |
| `<leader>cf` | 格式化当前文件                |
| `]d` / `[d`  | 下一个 / 上一个诊断(错误警告) |
| `<leader>cd` | 查看当前行诊断详情            |

### 搜索 / 替换 / 编辑

| 键             | 作用                               |
| -------------- | ---------------------------------- |
| `/` 然后输入   | 当前文件内搜索,`n`/`N` 跳下/上一个 |
| `<leader>sr`   | 项目内搜索并替换(Grug-far)         |
| `gcc`          | 注释/取消注释当前行                |
| `gc`(可视模式) | 注释选中区域                       |
| `u` / `<C-r>`  | 撤销 / 重做                        |

### Git

| 键            | 作用                              |
| ------------- | --------------------------------- |
| `<leader>gg`  | 打开 LazyGit(强烈推荐,图形化 git) |
| `<leader>gb`  | 当前行 git blame(谁改的)          |
| `]h` / `[h`   | 下/上一处改动(hunk)               |
| `<leader>ghs` | 暂存(stage)当前 hunk              |

LazyGit 本身不内置 AI 生成 commit 功能，通过它的 `customCommands` 机制接了一个自定义脚本来实现 —— 复用 `claude` CLI 的登录态，不需要任何 API key。

用法：在文件面板暂存(`空格`/`a`)好改动后，按 **`Ctrl+a`** → Claude 读取 staged diff 生成 Conventional Commits 信息 → 自动弹出编辑器预填好，审阅/微调后保存即提交(清空内容退出则取消)。

| 键       | 作用                           | 在哪个面板 |
| -------- | ------------------------------ | ---------- |
| `Ctrl+a` | AI 生成 commit message(Claude) | 文件面板   |

涉及两个文件:

| 文件                                               | 作用                                                         |
| -------------------------------------------------- | ------------------------------------------------------------ |
| `~/.local/bin/lazygit-ai-commit`                   | 取 `git diff --cached` 喂给 `claude -p`，输出规范化的 commit 信息(剥掉代码围栏/首尾空行) |
| `~/Library/Application Support/lazygit/config.yml` | 绑定 `Ctrl+a` → 执行 `msg="$(lazygit-ai-commit)" && git commit -e -m "$msg"` |

### 其它常用

| 键           | 作用              |
| ------------ | ----------------- |
| `<leader>l`  | 打开 `:Lazy` 面板 |
| `<leader>qq` | 退出 Neovim       |
| `<leader>w`  | 保存当前文件      |
| `<leader>uC` | 切换配色方案      |
| `<leader>:`  | 命令历史          |

---

## 四、自定义快捷键

> 这些是在 `lua/plugins/` 里额外加的，默认 LazyVim 没有。

### 文件管理器 yazi(`yazi.lua`)

| 键           | 作用                    |
| ------------ | ----------------------- |
| `<leader>-`  | 在当前文件位置打开 yazi |
| `<leader>cw` | 在工作目录打开 yazi     |

### 终端 toggleterm(`toggleterm.lua`)

| 键                            | 作用                 |
| ----------------------------- | -------------------- |
| `Ctrl+\`                      | 打开/关闭浮动终端    |
| (终端内)`<C-\><C-n>` 或 `Esc` | 回到普通模式(可滚动) |

### 拆分/合并代码 treesj(`treesj.lua`)

| 键           | 作用                                   |
| ------------ | -------------------------------------- |
| `<leader>m`  | 切换:把一行展开成多行 / 把多行合成一行 |
| `<leader>mj` | 拆分(split)                            |
| `<leader>mm` | 合并(join)                             |

### AI 助手 codecompanion(`codecompanion.lua`)

| 键             | 作用                 |
| -------------- | -------------------- |
| `<leader>ac`   | 打开 AI 聊天窗       |
| `<leader>aa`   | AI 操作菜单(actions) |
| `<leader>at`   | 切换 AI 聊天窗显示   |
| `<leader>aC`   | CodeCompanion CLI    |
| (聊天窗内)`gh` | 历史对话列表         |

### Markdown 写作(`markdown-writing.lua` / `blink.lua`)

| 键                        | 作用                              |
| ------------------------- | --------------------------------- |
| `<leader>tm`              | 开启/关闭表格自动对齐(table-mode) |
| `:Tableize`               | 把选中文本转成表格                |
| (列表行)`回车`            | 自动续列表项 / 有序列表自动编号   |
| (列表)`Tab` / `Shift+Tab` | 升/降列表缩进层级(补全菜单没弹时) |
| (普通模式)`回车`          | 勾选/取消 `- [ ]` 复选框          |

### 补全 blink(markdown 中)

- 补全**菜单弹出**时:`Tab` 选下一项,`回车` 接受。
- 菜单**没弹**时:`回车` = 纯换行(不会再误替换内容)。

---

## Scratch 临时代码 + 运行(`snacks.lua` / `sniprun.lua`)

想快速验证一小段代码时用 scratch:写完用 sniprun 直接跑,结果内联显示。

### 打开 scratch

| 键           | 作用                                       |
| ------------ | ------------------------------------------ |
| `<leader>.`  | 打开/切换上一个 scratch(默认 markdown)     |
| `<leader>S`  | 从已有 scratch 列表里选                     |
| `<Ctrl>x` | 删除选中的 scratch |
| `<leader>rp/rg/rj/rs/rl` | 新建/打开 Python/Go/JavaScript/Rust/Lua scratch               |

打开 scratch 时，默认会创建与当前文件相同类型的格式（可通过上述自定义按键创建指定类型的文件），如果当前没有打开文件，就创建 markdown。scratch 文件会被持久化保存在磁盘上。

### 运行代码(sniprun)

scratch 默认只能运行 Lua 代码，安装 sniprun 插件后可以在 scratch 运行任何代码。


| 键                  | 作用                                   |
| ------------------- | -------------------------------------- |
| (可视模式)`<leader>r` | 跑**选中**的代码块(最常用)           |
| `<leader>rr`        | 跑**当前行**                           |
| `<leader>ra`        |  运行整段 scratch                          |
| `<leader>rL`        | 切换 live 模式(边写边自动跑)           |
| `<leader>rc`        | 关闭内联结果                           |
| `<leader>rq`        | 重置后端(卡住时)                       |


成功结果以行尾虚拟文本显示,报错弹底部 terminal。各语言依赖对应解释器在 `PATH` 里:Python→`python3`、JS→`node`、Go→`go run`、Rust→`cargo`/`rustc`。

---

## Markdown 数学公式渲染(LaTeX)

在 markdown 里写的 LaTeX 数学公式，可以由 `snacks.image`(`snacks.lua`)直接在编辑器里内联渲染成图片。

```markdown
行内公式 $E = mc^2$

块级公式：
$$
\int_0^1 x^2 \, dx = \frac{1}{3}
$$
```

光标离开公式所在行后显示渲染好的图片，移回该行则恢复成原始 LaTeX 方便编辑。

### 渲染链路

`treesitter 识别公式节点` → `tectonic 编译成 PDF` → `magick 转图片` → `终端图形协议显示`。

四环缺一不可，少任意一个公式都不会渲染。

### 依赖

| 依赖                | 作用                       | 安装                        |
| ------------------- | -------------------------- | --------------------------- |
| `latex` parser      | 让 treesitter 定位公式节点 | 已加入 `markdown.lua` 的 `ensure_installed` |
| `tree-sitter` CLI   | 新版 treesitter 编译 parser 用 | `brew install tree-sitter-cli` |
| `tectonic`          | 把 LaTeX 编译成 PDF        | `brew install tectonic`     |
| `magick`(ImageMagick) | PDF 转图片               | `brew install imagemagick`  |
| 支持图形协议的终端  | 内联显示图片(Ghostty/kitty 等) | —                       |

> 排查:跑 `:checkhealth snacks`，image 一节出现 `LaTeX math equations are supported` 即配置就绪。

---

## Markdown 中英文排版（盘古之白 / autocorrect）

保存 markdown 时自动在中英文、中文与数字之间补上空格（「盘古之白」），并规范标点，让中英混排更整齐。

```text
标题Hello世界         → 标题 Hello 世界
这是test测试123混排   → 这是 test 测试 123 混排
```

由 [`autocorrect`](https://github.com/huacnlee/autocorrect) 完成，接进 `conform.nvim` 作为 markdown 格式化链的**最后一步**（排在 prettier / mdformat 之后定稿），配置在 `formatting.lua`。LazyVim 默认保存即格式化，所以 `<leader>cf` 或直接 `:w` 都会触发；也可手动 `:lua require('conform').format()`。

### 依赖

| 依赖         | 作用                     | 安装                       |
| ------------ | ------------------------ | -------------------------- |
| `autocorrect` | 中英文加空格 / 规范标点 | `brew install autocorrect` |

> 必须在 `PATH` 上。终端里启动 nvim 没问题；若用 GUI 版（Neovide/VimR）不生效，多半是 GUI 没继承 shell 的 `PATH`。

### 实现要点

- 走 stdin 模式：`autocorrect --stdin --type markdown`，从 STDIN 读、纠正后写回 STDOUT。
- **切勿加 `--fix`**：那会往 stdout 混入一行 `AutoCorrect spend time...` 计时信息，污染 buffer。
- stdin 模式无法从扩展名推断类型，必须显式给 `--type markdown`。
- 想自定义规则（某些专有名词不纠正等），在仓库根放 `.autocorrectrc`（`autocorrect init` 生成），CLI 会自动读取。

---

## 普通模式自动切回英文输入法（`macism.lua`）

解决「插入模式打完中文，按 `Esc` 回普通模式时输入法还停在中文、`j/k/dd` 等命令失效」的问题。离开插入模式自动切到英文键盘，重新进入时恢复之前的中文输入法。

由 [`im-select.nvim`](https://github.com/keaising/im-select.nvim) 完成，配置在 `macism.lua`。

### 依赖

| 依赖     | 作用                   | 安装                  |
| -------- | ---------------------- | --------------------- |
| `macism` | 命令行查询 / 切换输入法 | `brew install macism` |

`macism` 用 Swift 编写、仍在维护，修了系统输入法切换的若干 bug，切换可靠。**macOS 上插件默认就调用 `macism`**（见源码 `OS_CONFIGS.macOS`），所以装好后 `opts` 里无需写 `default_command`。

> 查看某个输入法的 key：在该输入法下运行 `macism`。英文键盘通常是 `com.apple.keylayout.ABC`。

### 实现要点

- `default_im_select` 设为普通模式要切到的英文键盘 key（`com.apple.keylayout.ABC`）。
- 事件：`InsertLeave` / `CmdlineLeave` 切英文，`InsertEnter` 恢复之前输入法。
- 排查时先确认两件事：`which macism` 能找到、`ls ~/.local/share/nvim/lazy/im-select.nvim` 已安装；再看 `:messages` 有无报错。

---

## snacks picker 用 Tab 在列表 / 预览间切换（`snacks.lua`）

snacks picker（含通知历史 `Snacks.picker.notifications`）默认 `Tab` 是「选中并下移」。改成用 `Tab` 在**输入框 / 列表 ↔ 预览**之间来回聚焦，方便滚动查看长内容。配置在 `snacks.lua` 的 `opts.picker.win`。

| 位置（窗口）   | 按 `Tab`         |
| -------------- | ---------------- |
| 输入框 `input` | 聚焦预览         |
| 列表 `list`    | 聚焦预览         |
| 预览 `preview` | 切回列表         |

### 实现要点

- `input` 的绑定要同时给 `mode = { "i", "n" }`，否则插入模式下的输入框里 `Tab` 不生效。
- 动作名：`focus_preview`（聚焦预览）/ `focus_list`（聚焦列表）。
- 顺手给 `preview.wo = { wrap = true }`，让预览长行换行、不被右侧截断。

