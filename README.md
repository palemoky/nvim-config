# 💤 LazyVim
   
A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

# 我的 Neovim (LazyVim) 备忘录

> Leader 键 = **空格 `<Space>`**。文档里写 `<leader>` 就是按空格。
> **记不住键时的终极大招**:先按一下 `空格`,**停住别动**,屏幕下方会弹出菜单(which-key)告诉你接下来能按什么。这是新手最该养成的习惯!

---

## 一、备份配置

你的配置就在 `~/.config/nvim`,它已经是个 git 仓库,但**远程目前指向 LazyVim 官方模板,不是你自己的**,所以现在 push 不上去。先做一次性设置,以后备份就是三条命令。

### 1. 一次性:绑定到你自己的 GitHub 仓库

**方法 A — 用 `gh`(已登录 GitHub CLI 时最简单):**
```bash
cd ~/.config/nvim
gh repo create my-nvim-config --private --source=. --remote=origin --push
```
这条会自动建一个私有仓库、改好 remote、并推送。

**方法 B — 手动:**
1. 去 https://github.com/new 建一个空仓库(比如叫 `my-nvim-config`,选 Private,**不要**勾初始化 README)。
2. 然后:
```bash
cd ~/.config/nvim
git remote set-url origin https://github.com/<你的用户名>/my-nvim-config.git
git add -A
git commit -m "我的 LazyVim 配置初始备份"
git push -u origin main
```

> 提示:`lazy-lock.json` **要一起提交**(锁定插件版本,换机器能装出一模一样的环境)。

### 2. 以后每次备份(改完配置后)
```bash
cd ~/.config/nvim
git add -A
git commit -m "改了什么就写什么"
git push
```

### 3. 在新电脑 / 重装后恢复
```bash
git clone https://github.com/<你的用户名>/my-nvim-config.git ~/.config/nvim
nvim   # 首次打开会自动按 lazy-lock.json 安装所有插件
```

### 4. 偷懒备份(不想用 git 时)
直接打包整个目录:
```bash
cp -r ~/.config/nvim ~/nvim-backup-$(date +%Y%m%d)
```

---

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

## 三、最常用快捷键速查(LazyVim 默认)

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

## 四、我自己配置的自定义快捷键

> 这些是你在 `lua/plugins/` 里额外加的,默认 LazyVim 没有。

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

## 五、新手最该记住的 5 件事

1. **不知道按什么 → 按 `空格` 等菜单弹出**(which-key)。
2. **退出编辑模式 → `Esc`**(或 `jk`,LazyVim 默认插入模式快速退出)。
3. **保存 → `<leader>w`;退出 → `<leader>qq`**。
4. **出问题先 `:checkhealth` 和 `:Lazy`** 看红色报错。
5. **每次改完配置 → git commit + push 备份**(见第一节)。

---

*最后更新:配置目录 `~/.config/nvim`。改完记得备份!*
