return {
  "folke/trouble.nvim",
  opts = {
    -- <leader>cs 打开的就是 symbols 模式（右侧 Document Symbols 大纲）
    -- win.size 用 0~1 是占屏百分比，整数则是固定列数
    modes = {
      symbols = {
        win = { size = 0.2 },
      },
    },
  },
}
