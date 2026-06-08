return {
  {
    "folke/persistence.nvim",
    opts = {},
    init = function()
      -- 清掉 `nvim .` / `nvim` 启动残留的目录 buffer、空 [No Name]、以及 Neo-tree buffer。
      -- 只清未修改的，避免误删正在编辑的内容。
      local function wipe_junk_buffers()
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          if vim.fn.buflisted(buf) == 1 and not vim.bo[buf].modified then
            local name = vim.api.nvim_buf_get_name(buf)
            local ft = vim.bo[buf].filetype
            local is_dir = name ~= "" and vim.fn.isdirectory(name) == 1
            if name == "" or is_dir or ft == "neo-tree" then
              pcall(vim.api.nvim_buf_delete, buf, { force = true })
            end
          end
        end
      end

      -- 关闭所有 Neo-tree 窗口。
      local function close_neotree()
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          local buf = vim.api.nvim_win_get_buf(win)
          if vim.bo[buf].filetype == "neo-tree" then
            pcall(vim.api.nvim_win_close, win, true)
          end
        end
      end

      -- 保存前：关闭 Neo-tree（避免存进 session 导致恢复后宽度异常），
      -- 并写一次 scope 的 tab↔buffer 归属到 vim.g.ScopeState，
      -- 靠 sessionoptions 的 globals 一起存进 session，恢复时 scope 才能读回。
      vim.api.nvim_create_autocmd("User", {
        pattern = "PersistenceSavePre",
        callback = function()
          close_neotree()
          pcall(vim.cmd, "ScopeSaveState")
        end,
      })

      -- 加载前关闭 Neo-tree，否则它会和 session 的窗口布局冲突，导致目录被撑得过宽。
      vim.api.nvim_create_autocmd("User", {
        pattern = "PersistenceLoadPre",
        callback = close_neotree,
      })

      -- 恢复完成后清场，去掉启动残留的目录 buffer / [No Name]。
      vim.api.nvim_create_autocmd("User", {
        pattern = "PersistenceLoadPost",
        callback = function()
          vim.schedule(wipe_junk_buffers)
        end,
      })
    end,
  },
}
