-- Explicit formatter / linter setup for the languages I use.
-- The LazyVim lang extras already pull in most of these tools; this file makes
-- the choices explicit and fills the gaps (e.g. PHP has no formatter by default).
return {
  -- Formatters (conform.nvim)
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- Python: ruff handles both import sorting and formatting.
        python = { "ruff_organize_imports", "ruff_format" },
        -- Go: goimports (adds/sorts imports) then gofumpt (stricter gofmt).
        go = { "goimports", "gofumpt" },
        -- PHP: not configured by LazyVim out of the box.
        php = { "php_cs_fixer" },
        -- Rust uses rustfmt via rustaceanvim, no conform entry needed.
        -- Markdown: the mkdocs docs need 4-space nested-list indentation, which
        -- prettier collapses to 2. Use mdformat (+ mdformat-mkdocs) only under
        -- these docs trees; everywhere else keep LazyVim's markdown defaults.
        -- Add more roots to mkdocs_roots as needed (trailing slash required).
        markdown = function(bufnr)
          local mkdocs_roots = {
            "/Users/xinyu/Workspace/leetcode/docs/",
            "/Users/xinyu/Workspace/readings/docs/",
          }
          local path = vim.api.nvim_buf_get_name(bufnr)
          for _, root in ipairs(mkdocs_roots) do
            if path:sub(1, #root) == root then
              return { "mdformat", "autocorrect" }
            end
          end
          return { "prettier", "markdownlint-cli2", "markdown-toc", "autocorrect" }
        end,
      },
      formatters = {
        -- mdformat normalises every ordered-list marker to "1." by default;
        -- --number keeps the manual 1. 2. 3. consecutive numbering instead.
        mdformat = {
          prepend_args = { "--number" },
        },
        -- autocorrect: 在中英文/数字之间加「盘古之白」并规范标点。
        -- 放在格式化链最后定稿。--stdin 从 STDIN 读、纠正后写回 STDOUT（必须显式
        -- 给 --type，stdin 模式下无法从扩展名推断）；切勿加 --fix，那会往 stdout
        -- 混入 "AutoCorrect spend time..." 计时行污染 buffer。brew 安装，走 PATH。
        autocorrect = {
          command = "autocorrect",
          args = { "--stdin", "--type", "markdown" },
        },
      },
    },
  },

  -- Linters (nvim-lint)
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        go = { "golangcilint" },
        php = { "phpstan" },
        -- Python diagnostics come from the ruff LSP; Rust from rust-analyzer/clippy.
      },
    },
  },

  -- Make sure the external tools are installed via Mason.
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "gofumpt",
        "goimports",
        "golangci-lint",
        "php-cs-fixer",
        "phpstan",
      },
    },
  },
}
