-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- ~/.config/nvim/init.lua

-- rest.nvim formater
local function setup_json_formatting(bufnr)
    vim.bo[bufnr].formatexpr = ""
    vim.bo[bufnr].formatprg = "jq"
    vim.bo[bufnr].filetype = "http"
end

vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
    pattern = "*.http",
    callback = function(args)
        local bufnr = args.buf
        setup_json_formatting(bufnr)
    end,
})

-- LazyVim 默认对 markdown 等开启 spell，会把中文及夹杂的英文词都画上波浪线。
-- 重建该组：保留 wrap，但对 markdown 关闭 spell（其他文本类型仍保留拼写检查）。
vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("wrap_spell", { clear = true }),
    pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
    callback = function(ev)
        vim.opt_local.wrap = true
        vim.opt_local.spell = ev.match ~= "markdown"
    end,
})
