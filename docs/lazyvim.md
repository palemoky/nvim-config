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
