return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = {
            size = function(term)
                if term.direction == "horizontal" then
                    return 20
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            open_mapping = [[<c-\>]],
            start_in_insert = true,
            close_on_exit = true,
            auto_scroll = true,
            direction = "horizontal", -- 'horizontal' | 'vertical' | 'tab' | 'float'
            float_opts = {
                border = "curved", -- 'single' | 'double' | 'shadow' | 'curved' | ...
            },
        },
    }
}
