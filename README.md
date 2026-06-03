# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

> Leader 键 = **空格 `<Space>`**。文档里写 `<leader>` 就是按空格。
> **记不住键时的终极大招**:先按一下 `空格`,**停住别动**,屏幕下方会弹出菜单(which-key)告诉你接下来能按什么。这是新手最该养成的习惯!

---

## 一、备份配置

配置在 `~/.config/nvim`，它已经是个 git 仓库，但远程默认指向 LazyVim 官方模板，需要通过 `git remote set-url origin <url>` 来绑定为自己的仓库。

## 二、LazyVim / 插件管理

| 操作 | 命令 |
|---|---|
| 打开插件管理面板 | `:Lazy` |
| 更新所有插件 | `:Lazy update`(面板里按 `U`) |
| 安装缺失插件 | `:Lazy install`(面板里按 `I`) |
| 同步(装+删+更) | `:Lazy sync`(面板里按 `S`) |
| 查看启动耗时 | `:Lazy profile` |
| 健康检查(排查问题) | `:checkhealth` |
| 安装/管理 LSP、格式化器 | `:Mason` |
| 更新 LazyVim 本体 | `:LazyExtras`(管理功能扩展)+ `:Lazy update` |

> 在 `:Lazy` 面板里按 `?` 看所有快捷键,按 `q` 退出。

---

## 三、常用插件一览

### LazyVim 默认核心插件(开箱即用)
| 插件 | 作用 |
|---|---|
| lazy.nvim | 插件管理器(`:Lazy`) |
| snacks.nvim | 全家桶:启动页 / picker / 通知 / 终端 / LazyGit 集成 / 图片预览 |
| which-key.nvim | 按键提示菜单(按 `<leader>` 停住会自动弹) |
| neo-tree.nvim | 左侧文件树(`<leader>e`) |
| snacks picker | 模糊查找文件 / 内容(LazyVim 默认已替代 telescope) |
| nvim-treesitter | 语法高亮 / 缩进 / 结构化选区 |
| nvim-lspconfig + mason.nvim | LSP 跳转/补全/诊断；Mason 负责装语言服务器 |
| blink.cmp | 自动补全引擎 |
| conform.nvim | 代码格式化(`<leader>cf`) |
| nvim-lint | 异步 linter(代码/拼写检查) |
| gitsigns.nvim | 行内 git 标记 + hunk 暂存/预览 |
| mini.pairs / surround / ai | 自动括号 / 环绕符号 / 增强文本对象 |
| flash.nvim | 闪电跳转(按 `s` + 字符) |
| trouble.nvim | 诊断 / 引用集中列表面板 |
| grug-far.nvim | 项目级搜索替换(`<leader>sr`) |
| todo-comments.nvim | 高亮 `TODO` / `FIX` / `NOTE` 等标记 |
| lualine.nvim | 底部状态栏 |
| bufferline.nvim | 顶部 buffer 标签栏 |
| noice.nvim | 命令行 / 通知 / 弹窗 UI 美化 |
| tokyonight.nvim | 配色方案(你设的是 `moon` 风格) |

### 你额外添加的插件(`lua/plugins/` 下)
| 插件 | 配置文件 | 作用 |
|---|---|---|
| codecompanion.nvim | `codecompanion.lua` | AI 聊天 / CLI(接 Claude Code) |
| yazi.nvim | `yazi.lua` | 终端文件管理器(`<leader>-`) |
| toggleterm.nvim | `toggleterm.lua` | 浮动 / 分屏终端(`Ctrl+\`) |
| treesj | `treesj.lua` | 一键拆分 / 合并代码块(`<leader>m`) |
| autolist.nvim | `markdown-writing.lua` | Markdown 列表自动续行 / 编号 |
| vim-table-mode | `markdown-writing.lua` | Markdown 表格自动对齐(`<leader>tm`) |
| crates.nvim | `rust.lua` | `Cargo.toml` 依赖版本提示 / 补全 |
| rustaceanvim | `rust.lua` | Rust 增强 LSP(rust-analyzer + 调试) |
| rest.nvim | `rest.lua` | 在编辑器里发 HTTP 请求(`.http` 文件) |

---

## 四、常用快捷键速查(LazyVim 默认)

### 文件 / 查找
| 键 | 作用 |
|---|---|
| `<leader>e` | 打开/关闭文件树(neo-tree) |
| `<leader>ff` | 查找文件(按文件名) |
| `<leader>fg` 或 `<leader>/` | 全局搜索文件内容(grep) |
| `<leader>fr` | 最近打开的文件 |
| `<leader>,` | 在已打开的 buffer 间切换 |
| `<leader><space>` | 查找文件(快捷版) |

### Buffer / 窗口(分屏)
| 键 | 作用 |
|---|---|
| `Shift+h` / `Shift+l` | 上一个 / 下一个 buffer |
| `<leader>bd` | 关闭当前 buffer |
| `<leader>bp` | 固定(pin)当前 buffer |
| `<C-w>s` / `<C-w>v` | 水平 / 垂直分屏 |
| `<C-h/j/k/l>` | 在分屏窗口间跳转(左下上右) |
| `<C-w>q` | 关闭当前窗口 |

### 代码 / LSP(光标停在符号上)
| 键 | 作用 |
|---|---|
| `gd` | 跳到定义 |
| `gr` | 查找所有引用 |
| `K` | 悬浮显示文档/类型 |
| `<leader>ca` | 代码操作(快速修复/重构) |
| `<leader>cr` | 重命名变量(全局) |
| `<leader>cf` | 格式化当前文件 |
| `]d` / `[d` | 下一个 / 上一个诊断(错误警告) |
| `<leader>cd` | 查看当前行诊断详情 |

### 搜索 / 替换 / 编辑
| 键 | 作用 |
|---|---|
| `/` 然后输入 | 当前文件内搜索,`n`/`N` 跳下/上一个 |
| `<leader>sr` | 项目内搜索并替换(Grug-far) |
| `gcc` | 注释/取消注释当前行 |
| `gc`(可视模式) | 注释选中区域 |
| `u` / `<C-r>` | 撤销 / 重做 |

### Git
| 键 | 作用 |
|---|---|
| `<leader>gg` | 打开 LazyGit(强烈推荐,图形化 git) |
| `<leader>gb` | 当前行 git blame(谁改的) |
| `]h` / `[h` | 下/上一处改动(hunk) |
| `<leader>ghs` | 暂存(stage)当前 hunk |

### 其它常用
| 键 | 作用 |
|---|---|
| `<leader>l` | 打开 `:Lazy` 面板 |
| `<leader>qq` | 退出 Neovim |
| `<leader>w` | 保存当前文件 |
| `<leader>uC` | 切换配色方案 |
| `<leader>:` | 命令历史 |

---

## 五、自定义快捷键

> 这些是在 `lua/plugins/` 里额外加的，默认 LazyVim 没有。

### 文件管理器 yazi(`yazi.lua`)
| 键 | 作用 |
|---|---|
| `<leader>-` | 在当前文件位置打开 yazi |
| `<leader>cw` | 在工作目录打开 yazi |

### 终端 toggleterm(`toggleterm.lua`)
| 键 | 作用 |
|---|---|
| `Ctrl+\` | 打开/关闭浮动终端 |
| (终端内)`<C-\><C-n>` 或 `Esc` | 回到普通模式(可滚动) |

### 拆分/合并代码 treesj(`treesj.lua`)
| 键 | 作用 |
|---|---|
| `<leader>m` | 切换:把一行展开成多行 / 把多行合成一行 |
| `<leader>mj` | 拆分(split) |
| `<leader>mm` | 合并(join) |

### AI 助手 codecompanion(`codecompanion.lua`)
| 键 | 作用 |
|---|---|
| `<leader>ac` | 打开 AI 聊天窗 |
| `<leader>aa` | AI 操作菜单(actions) |
| `<leader>at` | 切换 AI 聊天窗显示 |
| `<leader>aC` | CodeCompanion CLI |
| (聊天窗内)`gh` | 历史对话列表 |

### Markdown 写作(`markdown-writing.lua` / `blink.lua`)
| 键 | 作用 |
|---|---|
| `<leader>tm` | 开启/关闭表格自动对齐(table-mode) |
| `:Tableize` | 把选中文本转成表格 |
| (列表行)`回车` | 自动续列表项 / 有序列表自动编号 |
| (列表)`Tab` / `Shift+Tab` | 升/降列表缩进层级(补全菜单没弹时) |
| (普通模式)`回车` | 勾选/取消 `- [ ]` 复选框 |

### 补全 blink(markdown 中)
- 补全**菜单弹出**时:`Tab` 选下一项,`回车` 接受。
- 菜单**没弹**时:`回车` = 纯换行(不会再误替换内容)。

---

## 六、LazyGit & LazyDocker(终端 TUI)

LazyGit / LazyDocker 都是独立的命令行 TUI 工具，操作逻辑相通：**左侧是面板列表，`Tab` 或 `[` `]` 切面板，`↑↓`/`jk` 选条目，回车进入，`q` 退出,`?` 看全部快捷键**。记不住时随时按 `?`。

### 启动方式
| 工具 | 在 Neovim 里 | 在普通终端 |
|---|---|---|
| LazyGit | `<leader>gg`(snacks 内置集成) | `lazygit` |
| LazyDocker | 暂未配快捷键,可在 toggleterm(`Ctrl+\`)里敲 `lazydocker` | `lazydocker` |

> 想给 LazyDocker 加快捷键,可以新建 `lua/plugins/lazydocker.lua` 用 `Snacks.terminal("lazydocker")` 包一个 keymap;需要的话我可以帮你配。

### LazyGit 常用操作
面板(`1`~`5` 可直接跳):`1` 状态 / `2` 文件 / `3` 分支 / `4` 提交 / `5` 储藏(stash)。

| 键 | 作用 | 在哪个面板 |
|---|---|---|
| `空格` | 暂存 / 取消暂存选中文件(stage/unstage) | 文件面板 |
| `a` | 暂存 / 取消暂存全部 | 文件面板 |
| `回车` | 展开文件看逐行 diff；再 `空格` 可按行暂存 | 文件面板 |
| `c` | 提交(写 commit message) | 文件面板 |
| `A` | 修补上一次提交(amend) | 文件面板 |
| `d` | 丢弃改动 / 还原文件 | 文件面板 |
| `P` / `p` | 推送 push / 拉取 pull | 任意 |
| `空格` | 检出(checkout)选中分支 | 分支面板 |
| `n` | 基于当前分支新建分支 | 分支面板 |
| `M` | 合并选中分支到当前分支 | 分支面板 |
| `r` | 变基(rebase)到选中分支 | 分支面板 |
| `回车` | 查看某次提交的文件改动 | 提交面板 |
| `g` | 交互式 reset 到选中提交(soft/mixed/hard) | 提交面板 |
| `c` | cherry-pick(配合 `v` 复制提交) | 提交面板 |
| `s` | 把当前改动存进 stash | 文件 / 储藏面板 |
| `空格` | 应用(apply)储藏 | 储藏面板 |
| `+` / `-` | 放大 / 缩小当前面板 | 任意 |
| `q` | 退出 | 任意 |

> 冲突处理:合并/变基冲突时进文件面板,回车进入冲突文件,用 `空格` 选保留哪一边的块。

#### AI 自动生成 commit message
LazyGit 本身不内置 AI 生成 commit 功能，通过它的 `customCommands` 机制接了一个自定义脚本来实现 —— 复用 `claude` CLI 的登录态，不需要任何 API key。

用法：在文件面板暂存(`空格`/`a`)好改动后，按 **`Ctrl+a`** → Claude 读取 staged diff 生成 Conventional Commits 信息 → 自动弹出编辑器预填好，审阅/微调后保存即提交(清空内容退出则取消)。

| 键 | 作用 | 在哪个面板 |
|---|---|---|
| `Ctrl+a` | AI 生成 commit message(Claude) | 文件面板 |

涉及两个文件:

| 文件 | 作用 |
|---|---|
| `~/.local/bin/lazygit-ai-commit` | 取 `git diff --cached` 喂给 `claude -p`，输出规范化的 commit 信息(剥掉代码围栏/首尾空行) |
| `~/Library/Application Support/lazygit/config.yml` | 绑定 `Ctrl+a` → 执行 `msg="$(lazygit-ai-commit)" && git commit -e -m "$msg"` |

### LazyDocker 常用操作
面板：容器(Containers)/ 镜像(Images)/ 卷(Volumes)/ 网络(Networks)/ Compose 项目。选中条目后下方实时显示日志、配置、资源占用。

| 键 | 作用 |
|---|---|
| `Tab` | 切换左侧面板 |
| `回车` / 选中 | 在右下查看该容器的日志 / 状态 / 配置 |
| `d` | 删除选中项(容器 / 镜像 / 卷),弹出菜单确认 |
| `s` | 停止(stop)选中容器 |
| `r` | 重启(restart)选中容器 |
| `p` | 暂停 / 恢复(pause)容器 |
| `a` | 进入容器内 shell(attach / exec) |
| `m` | 查看容器日志(更大窗口) |
| `E` | 在容器里执行命令 |
| `b` | 对选中项执行批量操作菜单(如 prune 清理) |
| `x` | 打开当前面板的操作菜单(看有哪些动作) |
| `[` / `]` | 切换右下角的子标签(日志 / 统计 / env 等) |
| `+` / `-` | 放大 / 缩小当前面板 |
| `q` | 退出 |

> 不确定某个面板能做什么,按 `x` 看可用动作菜单,或按 `?` 看全局帮助。

---

