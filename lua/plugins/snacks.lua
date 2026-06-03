return {
  "folke/snacks.nvim",
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
