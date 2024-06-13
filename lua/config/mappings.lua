vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- [p]roject [v]iew
vim.keymap.set("n", "<leader>gs", vim.cmd.Git) --[g]et [s]tatus
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle) --[g]et [s]tatus

vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help) --[s]ignature
vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help) --[s]ignature

vim.keymap.set("n", "<leader>h", function() -- [e]xplore files with harpoon
    require("harpoon.ui").toggle_quick_menu()
end
)
vim.keymap.set("n", "<leader>a", function() -- [a]dd files to harpoon
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
vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition)
vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename)
vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)
