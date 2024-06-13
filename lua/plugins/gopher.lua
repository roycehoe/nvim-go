return {
    {
        "olexsmir/gopher.nvim",
        config = function()
            -- Define Gopher (Go development) key mappings directly
            vim.api.nvim_set_keymap('n', '<leader>gsj', '<cmd>GoTagAdd json<CR>', { noremap = true, silent = true, desc = 'Add json struct tags' })
            vim.api.nvim_set_keymap('n', '<leader>gsy', '<cmd>GoTagAdd yaml<CR>', { noremap = true, silent = true, desc = 'Add yaml struct tags' })
        end,
        build = function()
            -- Automatically install Go dependencies when setting up the plugin
            vim.cmd [[silent! GoInstallDeps]]
        end
    },
}
