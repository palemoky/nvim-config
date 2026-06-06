-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.lazyvim_rust_diagnostics = "rust-analyzer"

-- 显式用 snacks 作为搜索选择器（<leader><space> 等）。
-- 本配置 lazyvim.json 的 install_version=7，LazyVim 会沿用旧默认 picker=fzf；
-- 而 fzf-lua 从 Snacks dashboard 打开文件时不会清掉 dashboard 底层那个空窗，
-- 会残留一个 [No Name] 窗口。snacks picker 与 dashboard 同源、能干净处理。
-- 注意：只改 picker，不动 explorer，保持 neo-tree 作为文件树。
vim.g.lazyvim_picker = "snacks"

-- 让 Neovim 接管终端标题（否则一直显示启动命令，如 "nvim ."）
vim.opt.title = true
-- 标题格式：项目目录名 • 当前文件名（无文件时只显示项目名）
vim.opt.titlestring = "%{fnamemodify(getcwd(), ':t')}%( • %t%)"
