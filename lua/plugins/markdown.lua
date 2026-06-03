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
}
