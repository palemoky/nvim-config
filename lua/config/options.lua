-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.lazyvim_rust_diagnostics = "rust-analyzer"

-- 让 Neovim 接管终端标题（否则一直显示启动命令，如 "nvim ."）
vim.opt.title = true
-- 标题格式：项目目录名 • 当前文件名（无文件时只显示项目名）
vim.opt.titlestring = "%{fnamemodify(getcwd(), ':t')}%( • %t%)"
