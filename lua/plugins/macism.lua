return {
  -- 自动切换输入法：离开插入模式时切回英文键盘，避免普通模式下中文输入法导致命令失效。
  -- 依赖命令行工具 macism（brew install macism；macOS 上插件默认即调用它）。
  {
    "keaising/im-select.nvim",
    event = "InsertEnter",
    opts = {
      -- 普通模式默认使用的输入法（macOS 英文键盘）。
      default_im_select = "com.apple.keylayout.ABC",
      -- 离开插入模式自动切到 default_im_select，进入插入模式恢复之前的输入法。
      set_default_events = { "VimEnter", "InsertLeave", "CmdlineLeave" },
      set_previous_events = { "InsertEnter" },
    },
  },
}
