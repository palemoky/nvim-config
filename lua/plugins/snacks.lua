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
