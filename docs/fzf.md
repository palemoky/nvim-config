# fzf

fzf 是用 Go 编写的通用命令行模糊查找器,可以对任何列表(文件、历史命令、进程、git 分支等)进行交互式过滤,常与 fd、ripgrep、bat 搭配使用。

## Shell 快捷键(zsh 集成)

| 按键     | 功能                                     |
| -------- | ---------------------------------------- |
| `Ctrl+T` | 模糊查找文件/目录,选中后插入到命令行     |
| `Ctrl+R` | 模糊搜索命令历史                         |
| `Alt+C`  | 模糊查找目录并直接 `cd` 进去             |

> 模糊补全:在命令后输入 `**` 再按 `Tab`,如 `vim **<Tab>`、`cd **<Tab>`、`kill -9 **<Tab>`、`ssh **<Tab>`。

## 搜索语法

| 写法            | 含义                              |
| --------------- | --------------------------------- |
| `abc`           | 模糊匹配(默认)                    |
| `'abc`          | 精确匹配(包含 abc)                |
| `^abc`          | 以 abc 开头                       |
| `abc$`          | 以 abc 结尾                       |
| `!abc`          | 排除包含 abc 的行                 |
| `!^abc`         | 排除以 abc 开头的行               |
| `foo bar`       | 同时匹配 foo 和 bar(AND)          |
| `foo \| bar`    | 匹配 foo 或 bar(OR)               |

## 窗口内操作

| 按键               | 功能                         |
| ------------------ | ---------------------------- |
| `Ctrl+J` / `Ctrl+K`| 下移/上移(也可用方向键)      |
| `Enter`            | 确认选择                     |
| `Esc` / `Ctrl+C`   | 取消退出                     |
| `Tab`              | 多选并下移(需 `-m` 多选模式) |
| `Shift+Tab`        | 多选并上移                   |
| `Ctrl+A`           | 全选(多选模式)               |
| `Ctrl+D` / `Ctrl+U`| 列表半页下翻/上翻            |
| `Shift+↑` / `Shift+↓` | 预览窗口上下滚动          |

## 常用命令组合

| 命令                                          | 功能                       |
| --------------------------------------------- | -------------------------- |
| `nvim $(fzf --preview 'bat --color=always {}')` | 带预览选文件后用 nvim 打开 |
| `fd --type f \| fzf`                          | 用 fd 提供文件列表         |
| `rg --line-number . \| fzf`                   | 按内容搜索后模糊过滤       |
| `git branch \| fzf \| xargs git switch`       | 模糊切换 git 分支          |
| `brew list \| fzf -m \| xargs brew uninstall` | 多选卸载 brew 包           |

## 常用选项

| 选项                  | 功能                                |
| --------------------- | ----------------------------------- |
| `-m` / `--multi`      | 允许 Tab 多选                       |
| `--preview '<cmd>'`   | 预览窗口,`{}` 为当前行占位符       |
| `--height 40%`        | 只占用屏幕下方 40%,不全屏          |
| `--layout=reverse`    | 输入框在顶部                        |
| `--query '<str>'`     | 启动时预填搜索词                    |
| `--bind '<key>:<动作>'` | 自定义按键,如 `ctrl-/:toggle-preview` |

> 全局默认参数可写入环境变量 `FZF_DEFAULT_OPTS`;默认数据源用 `FZF_DEFAULT_COMMAND`(如 `fd --type f --hidden --exclude .git`)。
