# LazyGit

> 以下内容直接在界面按 ? 即可获取

## 全局按键

| 按键               | 功能             |
| ------------------ | ---------------- |
| `q`                  | 退出             |
| `?`                  | 帮助             |
| `Esc`                | 取消/返回        |
| Tab/左右方向键/1~5 | 切换左侧面板     |
| `g`                  | reset HEAD       |
| `G`                  | 打开Pull Request |
| `p`                  | git pull         |
| `P`                  | git push         |
| `,,` / `..`| 面板中的顶部/底部|
| `+` | 调整窗口大小 |


## Files

| 按键  | 功能                  |
| ----- | --------------------- |
| space | 暂存/取消暂存单个文件 |
| `a`     | 全部暂存/取消暂存     |
| `c`     | commit                |
| `A`     | git commit --amend                      |
| `d`     | Discard（丢弃改动）   |
| `s` | Stash |
| Enter | 查看diff              |
| `e`     | 编辑文件              |


## Branches

| 按键  | 功能       |
| ----- | ---------- |
| space | 切换分支   |
| `M` | 合并选中分支到当前分支 |
| `-` | 在最近的分支间切换|
| `n`     | 新建分支   |
| `d`     | 删除分支   |
| `r`     | 重命名分支 |
| `f`     | git fetch  |


## Commits

| 按键       | 功能                |
| ---------- | ------------------- |
| space      | 查看差异            |
| `r`          | Reword 修改提交信息 |
| `s`          | Squash 压缩提交     |
| `f`          | Fixup 修复提交      |
| `d`          | Drop 丢弃提交       |
| `e`          | Edit 编辑提交       |
| Ctrl + k/j | 交互变基            |
| `C`          | Cherry-pick         |


## diff 配色（delta + 字符级逐词高亮）

> 解决"改一两个字（错别字）时，commit diff 整行红/绿、看不出差别"。

### 思路

lazygit 默认**不读** `core.pager`，要在它自己的配置里指定 pager 走 [delta](https://github.com/dandavison/delta)；delta 默认就做**行内逐词高亮**，再把 `word-diff-regex = .` 设成字符级，单个汉字的改动也能精确加亮。

### 配置位置（macOS 关键坑）

macOS 上 lazygit 读的是 `~/Library/Application Support/lazygit/`，**不是** `~/.config/lazygit/`（除非设了 `XDG_CONFIG_HOME`）。用 `lazygit --print-config-dir` 确认。

- `config.yml` —— **v0.62+ 用 `git.pagers`（列表）**，不是旧版的 `git.paging`（对象）：

  ```yaml
  git:
    pagers:
      - colorArg: always
        pager: delta --paging=never --config "/Users/xinyu/Library/Application Support/lazygit/delta.gitconfig"
  ```

- `delta.gitconfig` —— lazygit 专用的 delta 配置。`--config` 会**替换** `~/.gitconfig`，所以能让 lazygit 用统一视图、终端 `git diff` 仍用全局 side-by-side，互不影响。

### 关键参数

| 参数               | 作用                                                   |
| ------------------ | ------------------------------------------------------ |
| `--paging=never`   | 必须，否则 delta 自己分页会干扰 lazygit                |
| `word-diff-regex = .` | 字符级逐词高亮（对中文错别字精确到单字）             |
| `side-by-side`     | lazygit 窄面板用 `false`（统一视图）；终端可保留 `true` |
| `syntax-theme`     | 语法配色，这里用 `Catppuccin Macchiato`，搭 tokyonight-moon |
| `*-emph-style`     | 字符级改动的强调底色，刻意调亮一档让错别字更跳         |

> 增删行背景、行号、文件名/hunk 头都按 tokyonight-moon 调色板调成柔和色，完整内容见 `delta.gitconfig` 与全局 `~/.gitconfig` 的 `[delta]` 段（两处配色一致，仅 lazygit 用 `side-by-side = false`）。

### 易踩的坑

- `--side-by-side=false` 是**非法写法**：delta 里 `--side-by-side` 是不带值的开关，写成 `=false` 会让 delta 报错退出、lazygit 退回原始 diff。要关只能在 `--config` 的配置文件里写 `side-by-side = false`。
- `lazygit --config` 打印的是**默认参考配置**，不反映你的实际配置，别用它验证改动。


