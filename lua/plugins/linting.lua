-- snacks scratch 里的 go 文件落在 stdpath("data")/scratch 下，不属于任何 go module，
-- golangci-lint 一跑就 exit 3 报警告。这里用 LazyVim 的 condition 扩展：
-- scratch 目录下的 buffer 直接跳过 golangci-lint（那种零散片段也 lint 不出有意义的结果）。
local scratch_dir = vim.fs.normalize(vim.fn.stdpath("data") .. "/scratch")

return {
  "mfussenegger/nvim-lint",
  opts = {
    linters = {
      ["golangci-lint"] = {
        condition = function(ctx)
          return not vim.startswith(vim.fs.normalize(ctx.filename), scratch_dir)
        end,
      },
    },
  },
}
