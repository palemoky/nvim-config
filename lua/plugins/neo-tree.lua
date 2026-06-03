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
                    visible = true, -- 显示被过滤的项（点文件等会以暗色显示）；按 H 可临时切换
                    hide_dotfiles = false, -- 显示 .gitignore / .env 这类点文件
                    hide_gitignored = false, -- 显示被 .gitignore 忽略的文件
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
