return {
  -- 按 tab 隔离 buffer：在某个 tab 打开的文件只归该 tab，切到别的 tab 看不到。
  -- 配合 :tcd 按 tab 分项目使用，前端 / 后端的 buffer 互不混入。
  {
    "tiagovla/scope.nvim",
    event = "VeryLazy",
    -- restore_state：注册 SessionLoadPost 钩子，恢复会话时把 tab↔buffer 归属重建出来。
    opts = { restore_state = true },
    config = function(_, opts)
      require("scope").setup(opts)
    end,
  },
}
