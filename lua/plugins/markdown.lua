return {
  -- 关闭 markdown 的 markdownlint 诊断（MD001/MD013/MD041... 等 MD 开头的提示）。
  -- 注意：linters_by_ft 是深合并，直接写 markdown = {} 会被合并掉，必须用函数显式清空。
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.markdown = {}
      opts.linters_by_ft["markdown.mdx"] = {}
    end,
  },

  -- snacks.image 渲染 markdown 里的 LaTeX 数学公式需要 latex parser 来定位公式节点，
  -- 再交给 tectonic 编译成图片。少了它公式不会被识别，也就不渲染。
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "latex")
    end,
  },
}
