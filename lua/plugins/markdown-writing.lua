return {
  -- 列表自动续行：回车自动补 "- " / 有序列表自动重新编号 / Tab 调整缩进层级。
  -- 键位全部设为 buffer-local（只在散文类文件生效），不污染代码文件，
  -- 并与 blink.cmp 的 Tab/CR fallback 配合：菜单弹出归补全，菜单关闭归列表。
  {
    "gaoDean/autolist.nvim",
    ft = { "markdown", "text", "tex", "plaintex" },
    config = function()
      require("autolist").setup()

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("AutolistKeymaps", { clear = true }),
        pattern = { "markdown", "text", "tex", "plaintex" },
        callback = function(ev)
          local o = { buffer = ev.buf, silent = true }
          -- 插入模式：菜单关闭时才轮到这些（靠 blink 的 fallback 触发）
          vim.keymap.set("i", "<Tab>", "<cmd>AutolistTab<cr>", o)
          vim.keymap.set("i", "<S-Tab>", "<cmd>AutolistShiftTab<cr>", o)
          vim.keymap.set("i", "<CR>", "<CR><cmd>AutolistNewBullet<cr>", o)
          -- 普通模式
          vim.keymap.set("n", "o", "o<cmd>AutolistNewBullet<cr>", o)
          vim.keymap.set("n", "O", "O<cmd>AutolistNewBulletBefore<cr>", o)
          vim.keymap.set("n", "<CR>", "<cmd>AutolistToggleCheckbox<cr><CR>", o)
          vim.keymap.set("n", ">>", ">><cmd>AutolistRecalculate<cr>", o)
          vim.keymap.set("n", "<<", "<<<cmd>AutolistRecalculate<cr>", o)
          vim.keymap.set("n", "dd", "dd<cmd>AutolistRecalculate<cr>", o)
          vim.keymap.set("v", "d", "d<cmd>AutolistRecalculate<cr>", o)
        end,
      })
    end,
  },

  -- 表格自动对齐：:TableModeToggle（默认 <leader>tm）开启后边敲 | 边对齐。
  {
    "dhruvasagar/vim-table-mode",
    cmd = { "TableModeToggle", "TableModeEnable", "Tableize" },
    ft = { "markdown", "text" },
    init = function()
      vim.g.table_mode_corner = "|" -- markdown 兼容的表格边角
    end,
  },
}
