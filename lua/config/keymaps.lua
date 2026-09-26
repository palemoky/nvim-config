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
-- 方便从 CodeCompanion CLI / ClaudeCode 终端一键切回代码窗口。
-- 只设为 buffer-local，且只给 AI CLI 终端：全局映射会抢走 fzf / yazi 等
-- TUI 里的 Ctrl-j/k（上下移动）。
local function set_term_nav(buf)
  for key, dir in pairs({ ["<C-h>"] = "h", ["<C-j>"] = "j", ["<C-k>"] = "k", ["<C-l>"] = "l" }) do
    vim.keymap.set("t", key, "<C-\\><C-n><C-w>" .. dir, { buffer = buf, desc = "Go to window " .. dir })
  end
end

local term_nav = vim.api.nvim_create_augroup("ai_term_nav", { clear = true })
-- CodeCompanion CLI 的终端 buffer 会被设为这个 filetype
vim.api.nvim_create_autocmd("FileType", {
  group = term_nav,
  pattern = "codecompanion_cli",
  callback = function(ev)
    set_term_nav(ev.buf)
  end,
})
-- 其它方式直接起的 claude / codex 终端（buffer 名形如 term://...:claude）
vim.api.nvim_create_autocmd("TermOpen", {
  group = term_nav,
  callback = function(ev)
    local name = vim.api.nvim_buf_get_name(ev.buf)
    if name:match(":claude") or name:match(":codex") then
      set_term_nav(ev.buf)
    end
  end,
})
