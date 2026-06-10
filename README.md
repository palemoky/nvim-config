# 💤 LazyVim

## 一、备份配置

配置在 `~/.config/nvim`，它已经是个 git 仓库，但远程默认指向 LazyVim 官方模板，需要通过 `git remote set-url origin <url>` 来绑定为自己的仓库。



## 二、快速上手文档

- [Vim](./docs/vim.md)

- [LazyVim](./docs/lazyvim.md)

- [LazyGit](./docs/lazygit.md)

- [LazyDocker](./docs/lazydocker.md)

## 三、终端字体

使用 Ghostty 时，终端的中文默认使用 Pingfang，但兼容性并不好，可以使用专门针对终端优化的 [Maple Font](https://github.com/subframe7536/maple-font/releases)，该字体的含义说明如下：
- NF：Nerd Font，兼容终端的图标
- Normal：没有手写字体，默认包含
- Ligature：自动转换连字符，比如`!=`转换为`≠`
因此，应该选择 NF-CN 行，Normal-Ligature 或 Normal-No-Ligature 列的字体

Ghostty 不错的主题：
| Dark           | Light                   |
| -------------- | ----------------------- |
| Adventure      | Belafonte Day           |
| Apple Classic  | Builtin Solarized Light |
| **Arthur**     | GruvboxLight            |
| **Atom**       | iTerm2 Solarized Light  |
| **Ayu Mirage** | Man Page                |
| Desert         | Novel                   |
| NvimDark       | Vimbones                |
| Teerb          | Violet Light            |
| Wombat         |                         |

