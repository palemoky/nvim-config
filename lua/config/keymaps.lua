-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Open the first http(s) URL on the current line, ignoring leading CJK text
vim.keymap.set("n", "gx", function()
  local line = vim.api.nvim_get_current_line()
  local url = line:match("https?://[%w%-%._~:/?#%[%]@!%$&'%(%)%*%+,;=%%]+")
  if url then
    vim.ui.open(url)
  else
    vim.notify("No URL found on the current line", vim.log.levels.WARN)
  end
end, { desc = "Open URL on line" })

-- 终端模式下也能用 <C-h/j/k/l> 切窗口（先退出 terminal 模式再跳）
-- 方便从 CodeCompanion CLI / ClaudeCode 终端一键切回代码窗口
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Go to left window" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Go to lower window" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Go to upper window" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Go to right window" })
