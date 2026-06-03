-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- python3
vim.g.python3_host_prog = os.getenv("HOME") .. "/.virtualenvs/py3nvim/bin/python"

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- use system clipboard
vim.opt.clipboard = "unnamedplus"
