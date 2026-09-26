-- 侧边栏宽度：按屏幕宽度（vim.o.columns）的百分比计算
-- run `:lua print(vim.o.columns)` to get the current screen width
local function sidebar_width()
    local screen_width = vim.o.columns
    if screen_width > 200 then
        return math.floor(screen_width * 0.15)
    else
        return math.floor(screen_width * 0.25)
    end
end

-- neo-tree 只在打开时算一次宽度；终端尺寸变化后按百分比重新调整。
-- 注意：不能写在 spec 的 init 里 —— lazy.nvim 的 init 不合并、会整个覆盖
-- LazyVim neo-tree extra 的 init，而后者负责 `nvim .` 时自动打开 neo-tree。
vim.api.nvim_create_autocmd("VimResized", {
    group = vim.api.nvim_create_augroup("neo_tree_percent_width", { clear = true }),
    callback = function()
        local width = sidebar_width()
        for _, win in ipairs(vim.api.nvim_list_wins()) do
            local buf = vim.api.nvim_win_get_buf(win)
            if vim.bo[buf].filetype == "neo-tree"
                and vim.api.nvim_win_get_config(win).relative == "" then
                vim.api.nvim_win_set_width(win, width)
            end
        end
    end,
})

return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            filesystem = {
                filtered_items = {
                    visible = true, -- 默认显示被过滤的项（点文件等以暗色显示）；按 H 在显示/隐藏间切换
                    hide_dotfiles = true, -- 把点文件标记为“被过滤项”，这样 H 才能隐藏它们（visible=true 时仍默认显示）
                    hide_gitignored = true, -- 把 gitignore 文件标记为“被过滤项”，同样受 H 控制
                    never_show = { ".DS_Store" }, -- 始终隐藏 .DS_Store（即使 visible/hide_dotfiles 设置为显示）
                },
            },
            window = {
                position = "left",
                -- 也可以直接写字符串百分比，如 width = "20%"（打开时按屏幕宽度换算）
                width = sidebar_width,
            },
        },
    }
}
