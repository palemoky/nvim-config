return {
  { "rest-nvim/rest.nvim", dependencies = { "nvim-treesitter/nvim-treesitter" } },

  -- rest.nvim 需要 http parser 才能解析 .http 文件
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "http")
    end,
  },
}
