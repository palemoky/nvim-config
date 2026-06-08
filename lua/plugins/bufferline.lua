return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        -- scope.nvim 让每个 tab 通常只剩 1 个 buffer，默认的 false 会在
        -- buffer ≤1 时把整条 bufferline（含右侧 tab 指示器）隐藏。设为 true 保持常显。
        always_show_bufferline = true,
        -- 常显后，启动时空的 [No Name] 也会露出来。把「未命名且未修改」的空 buffer
        -- 从 bufferline 滤掉；一旦开始编辑（modified）或有了文件名就照常显示。
        custom_filter = function(buf)
          if vim.api.nvim_buf_get_name(buf) == "" and not vim.bo[buf].modified then
            return false
          end
          return true
        end,
      },
    },
  },
}
