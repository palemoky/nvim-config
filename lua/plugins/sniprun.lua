-- sniprun：选中一段代码 / 单行直接执行，结果内联显示（virtual text）。
-- 主要用来在 scratch（Snacks.scratch）或任意 buffer 里快速验证一小段逻辑。
--
-- 后端是 Rust 写的二进制：build = "sh ./install.sh" 会优先下载官方预编译版，
-- 失败时才本地 cargo 编译（你已装 rust toolchain，兜底没问题）。
return {
  "michaelb/sniprun",
  branch = "master",
  build = "sh ./install.sh",

  -- 只在用到时加载：用 keys 触发，外加几个手动命令
  cmd = { "SnipRun", "SnipReset", "SnipClose" },
  keys = {
    -- visual：跑选中的代码块（最常用 —— scratch 里框一段直接看结果）
    { "<leader>r", mode = "v", "<cmd>'<,'>SnipRun<cr>", desc = "SnipRun: selection" },
    -- normal：跑当前行
    { "<leader>rr", "<cmd>SnipRun<cr>", desc = "SnipRun: current line" },
    -- 跑整个 buffer（%=1,$ 全文范围）—— 验证整段 scratch 时用
    { "<leader>ra", "<cmd>%SnipRun<cr>", desc = "SnipRun: whole buffer" },
    -- live 模式：边写边自动跑。命令 SnipLive 定义在子模块里、不能直接当 lazy 触发，
    -- 所以这里手动 require 子模块再 toggle（按键触发加载，子模块随之注册）。
    {
      "<leader>rL",
      function()
        require("sniprun.live_mode").toggle()
      end,
      desc = "SnipRun: toggle live mode",
    },
    -- 清掉内联结果 / 重置后端（卡住或想清屏时用）
    { "<leader>rc", "<cmd>SnipClose<cr>", desc = "SnipRun: close results" },
    { "<leader>rq", "<cmd>SnipReset<cr>", desc = "SnipRun: reset backend" },
  },

  opts = {
    -- 结果展示方式：优先用虚拟文本贴在行尾，长输出落到底部临时窗口
    display = {
      "VirtualTextOk", -- 成功结果：行尾虚拟文本
      "TerminalErr", -- 报错：底部 terminal 显示完整 stderr
    },
    display_options = {
      terminal_width = 45,
    },
    -- 结果虚拟文本与代码之间留点间距，便于阅读
    inline_messages = false,
    borders = "rounded",
  },
}
