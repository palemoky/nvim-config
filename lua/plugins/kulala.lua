return {
  {
    "mistweaverco/kulala.nvim",
    ft = { "http", "rest" },
    keys = {
      { "<leader>R", "", desc = "+Rest (kulala)", ft = { "http", "rest" } },
      { "<leader>Rs", function() require("kulala").run() end, desc = "Send request", ft = { "http", "rest" } },
      { "<leader>Ra", function() require("kulala").run_all() end, desc = "Send all requests", ft = { "http", "rest" } },
      { "<leader>Rr", function() require("kulala").replay() end, desc = "Replay last request", ft = { "http", "rest" } },
      { "<leader>Rt", function() require("kulala").toggle_view() end, desc = "Toggle body/headers view", ft = { "http", "rest" } },
      { "<leader>Rc", function() require("kulala").copy() end, desc = "Copy as cURL", ft = { "http", "rest" } },
      { "<leader>Rf", function() require("kulala").from_curl() end, desc = "Paste from cURL", ft = { "http", "rest" } },
      { "<leader>Rq", function() require("kulala").close() end, desc = "Close response window", ft = { "http", "rest" } },
      { "<leader>Rb", function() require("kulala").scratchpad() end, desc = "Open scratchpad", ft = { "http", "rest" } },
      { "<leader>RS", function() require("kulala").show_stats() end, desc = "Show request stats", ft = { "http", "rest" } },
      { "]r", function() require("kulala").jump_next() end, desc = "Next request", ft = { "http", "rest" } },
      { "[r", function() require("kulala").jump_prev() end, desc = "Previous request", ft = { "http", "rest" } },
    },
    opts = {
      -- 响应展示在右侧分屏，默认展示格式化后的 body
      display_mode = "split",
      default_view = "body",
      -- 用 jq / xmllint 等自动格式化响应体（kulala 内置，无需 autocmd hack）
      contenttypes = {
        ["application/json"] = {
          ft = "json",
          formatter = { "jq", "." },
        },
      },
    },
  },

  -- kulala 同样需要 http parser 才能解析 .http 文件
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "http")
    end,
  },
}
