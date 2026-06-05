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
                width = function() -- run `:echo winwidth(0)` to get the current window width
                    local screen_width = vim.o.columns -- run `:lua print(vim.o.columns)` to get the current screen width
                    -- Solution 1: Fixed width
                    -- return 30

                    -- Solution 2: Dyunamic width based on screen width
                    if screen_width > 200 then
                        return math.floor(screen_width * 0.15)
                    else
                        return math.floor(screen_width * 0.25)
                    end
                end,
            },
        },
    }
}
