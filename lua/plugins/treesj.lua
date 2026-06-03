-- treesj 支持的文件类型（对应内置 preset，markdown/vimdoc 等不支持的不在此列）
local treesj_ft = {
  "bash",
  "c",
  "cpp",
  "css",
  "go",
  "html",
  "javascript",
  "javascriptreact",
  "json",
  "jsonc",
  "lua",
  "python",
  "rust",
  "scss",
  "sql",
  "terraform",
  "toml",
  "typescript",
  "typescriptreact",
  "vue",
  "yaml",
}

return {
  -- treesj 只负责拆分/合并；parser 由 nvim-treesitter 安装
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    -- 只在支持的文件类型里加载
    ft = treesj_ft,
    opts = {
      use_default_keymaps = false,
      check_syntax_error = true,
      max_join_length = 120,
      cursor_behavior = "hold",
      notify = true,
      dot_repeat = true,
    },
    config = function(_, opts)
      require("treesj").setup(opts)
      -- 仅在支持的文件类型里设置 buffer-local 键位
      vim.api.nvim_create_autocmd("FileType", {
        pattern = treesj_ft,
        callback = function(event)
          local map = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = event.buf, desc = desc })
          end
          map("<leader>m", "<cmd>TSJToggle<cr>", "Toggle treesj split/join")
          map("<leader>Mj", "<cmd>TSJSplit<cr>", "Split (treesj)")
          map("<leader>Mm", "<cmd>TSJJoin<cr>", "Join (treesj)")
        end,
      })
    end,
  },

  -- 在这里安装 treesj 需要的 parser
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed or {}, {
        "lua",
        "vim",
        "vimdoc",
        "bash",
        "python",
        "javascript",
        "typescript",
        "json",
        "yaml",
        "toml",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "rust",
        "go",
        "dockerfile",
      })
    end,
  },
}
