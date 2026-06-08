return {
  "folke/snacks.nvim",

  -- scratch 的文件类型在「创建那一刻」由 ft 定死，并写进落盘文件名的哈希里；
  -- 事后 :set ft=xxx 只改当前 buffer 临时选项、不持久化，也不会换文件。
  -- 所以「想写哪种语言」要在打开时就用 ft 指定 —— 每种语言各有独立 scratch 文件，可并存。
  -- 这些键和 sniprun 同属 <leader>r「跑代码」组：先 <leader>rp 开 python scratch，再 <leader>r 跑。
  keys = {
    {
      "<leader>rp",
      function()
        require("snacks").scratch.open({ ft = "python" })
      end,
      desc = "Scratch: Python",
    },
    {
      "<leader>rg",
      function()
        require("snacks").scratch.open({ ft = "go" })
      end,
      desc = "Scratch: Go",
    },
    {
      "<leader>rl",
      function()
        require("snacks").scratch.open({ ft = "lua" })
      end,
      desc = "Scratch: Lua",
    },
    {
      "<leader>rj",
      function()
        require("snacks").scratch.open({ ft = "javascript" })
      end,
      desc = "Scratch: JavaScript",
    },
    {
      "<leader>rs",
      function()
        require("snacks").scratch.open({ ft = "rust" })
      end,
      desc = "Scratch: Rust",
    },
  },

  opts = {
    -- picker（含通知历史 Snacks.picker.notifications）的窗口/按键定制
    picker = {
      win = {
        -- 输入框里按 Tab：聚焦右侧预览（默认是 select_and_next，这里改成聚焦预览）
        input = {
          keys = {
            ["<Tab>"] = { "focus_preview", mode = { "i", "n" } },
          },
        },
        -- 列表里按 Tab：同样聚焦预览
        list = {
          keys = {
            ["<Tab>"] = "focus_preview",
          },
        },
        preview = {
          wo = { wrap = true }, -- 预览默认换行，长内容不再被右侧截断
          keys = {
            ["<Tab>"] = "focus_list", -- 在预览里再按 Tab 切回列表
          },
        },
      },
    },
    -- 终端内图片预览，依赖 Ghostty/kitty 等支持图形协议的终端 + ImageMagick(magick)
    image = {
      enabled = true,
      -- 打开图片文件时自动渲染（png/jpg/gif/webp/svg/pdf 等）
      doc = {
        enabled = true, -- markdown / latex 文档里的图片也内联显示
        inline = true, -- 直接在文本下方内联渲染
      },
    },
  },
}
