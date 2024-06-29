return {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"go", "python"},
    opts = function()
        local null_ls = require("null-ls")
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        local opts = {
            sources = {
                -- null_ls.builtins.formatting.gofumpt,
                null_ls.builtins.formatting.gofmt,
                null_ls.builtins.formatting.goimports_reviser,
                null_ls.builtins.formatting.golines,

                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.black,
                -- null_ls.builtins.diagnostics.pylint.with({
                --     diagnostics_postprocess = function(diagnostic)
                --         diagnostic.code = diagnostic.message_id
                --     end,
                -- }),
                null_ls.builtins.diagnostics.golangci_lint
            },
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = bufnr })
                            vim.lsp.buf.format({ async = false })
                        end,
                    })
                end
            end,
        }
        return opts
    end,
}
