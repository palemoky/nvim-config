return {
  -- 纯 Lua 实现的实时预览，支持 HTML / Markdown / AsciiDoc / SVG。
  -- 启动后会起一个本地 server 并打开浏览器，文件保存后浏览器自动刷新（热重载）。
  {
    "brianhuster/live-preview.nvim",
    -- autosave.nvim 让你不用手动 :w 也能触发刷新（可选，去掉则保存时才刷新）。
    dependencies = { "brianhuster/autosave.nvim" },
    cmd = { "LivePreview" },
    opts = {},
    keys = {
      { "<leader>cp", "<cmd>LivePreview start<cr>", desc = "Live Preview (start)" },
      { "<leader>cP", "<cmd>LivePreview close<cr>", desc = "Live Preview (close)" },
    },
  },
}
