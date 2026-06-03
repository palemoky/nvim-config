return {
  -- markdown 里写正文时不想被补全抢输入：
  -- 让补全窗仍然弹出，但默认不预选、不自动写入。
  -- 这样回车 = 纯换行；想用补全时按 <Tab> 选中某项后再回车/Tab 接受。
  -- 仅对 markdown 生效，代码文件保持默认（预选）行为。
  {
    "saghen/blink.cmp",
    opts = {
      -- Tab/CR 采用 "fallback"：菜单弹出时归补全；菜单关闭时把按键交还给
      -- 其它（buffer-local）映射，从而让 autolist 的 Tab 缩进 / CR 续行生效。
      keymap = {
        ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      },
      completion = {
        list = {
          selection = {
            -- preselect=false：markdown 中不预选第一项，回车不会替换内容
            preselect = function(_)
              return vim.bo.filetype ~= "markdown"
            end,
            -- auto_insert=false：markdown 中移动选项时不把内容写进缓冲区
            auto_insert = function(_)
              return vim.bo.filetype ~= "markdown"
            end,
          },
        },
      },
    },
  },
}
