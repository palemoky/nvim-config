return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  keys = {
    { "<leader>m", "<cmd>TSJToggle<cr>", desc = "Toggle treesj split/join" },
    { "<leader>mj", "<cmd>TSJSplit<cr>", desc = "Split (treesj)" },
    { "<leader>mm", "<cmd>TSJJoin<cr>", desc = "Join (treesj)" },
  },
  opts = {
     use_default_keymaps = false,
     ensure_installed = {
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
    },
 },
}

