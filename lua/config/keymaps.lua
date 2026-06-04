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
