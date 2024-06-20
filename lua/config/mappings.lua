vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- [p]roject [v]iew
vim.keymap.set("n", "<leader>gs", vim.cmd.Git) --[g]it [s]tatus
vim.keymap.set("n", "<leader>gp", ":Git push<CR>") --[g]it [p]ush
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle) --[u]ndo tree toggle
vim.keymap.set("n", "<leader>h", ":nnoremap <silent> <c-c> :if (&hlsearch == 1) | set nohlsearch | else | set hlsearch | endif<cr>") --Toggle highlight search

vim.keymap.set("n", "<leader>hf", function() -- [f]iles stored in harpoon
    require("harpoon.ui").toggle_quick_menu()
end
)
vim.keymap.set("n", "<leader>ha", function() -- [a]dd files to harpoon
    require("harpoon.mark").add_file()
end
)
-- Window navigation mappings
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', { silent = true })
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', { silent = true })
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', { silent = true })
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', { silent = true })

-- LSP Mappings.
-- See `:help vim.lsp.*` for documentation on any of the below functions
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gs', vim.lsp.buf.hover)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)

-- Debugger mappings
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<leader>b', function() require('dap').toggle_breakpoint() end)

-- Configuring icons for breakpoints
vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '▶️', texthl = '', linehl = '', numhl = '' })

-- gopher mappings
vim.api.nvim_set_keymap('n', '<leader>gsj', '<cmd>GoTagAdd json<CR>', {
    noremap = true, silent = true, desc = 'Add json struct tags'
})
vim.api.nvim_set_keymap('n', '<leader>gsy', '<cmd>GoTagAdd yaml<CR>', {
    noremap = true, silent = true, desc = 'Add yaml struct tags'
})

-- telescope settings
vim.keymap.set('n', '<leader>pf', function() require('telescope.builtin').find_files() end)
vim.keymap.set('n', '<C-p>', function() require('telescope.builtin').git_files() end)
vim.keymap.set('n', '<leader>ps', function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', 'gD', function() require('telescope.builtin').lsp_references() end)

-- trouble settings
vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>")

-- git blame settings
vim.keymap.set("n", "<leader>gb", ":GitBlameToggle<cr>")
