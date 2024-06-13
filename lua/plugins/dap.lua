return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "rcarriga/nvim-dap-ui",
            "leoluz/nvim-dap-go",
        },
        config = function()
            local dap, dapui = require("dap"), require("dapui")

            require("dap-go").setup()
            require("dapui").setup()

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

            vim.keymap.set('n', '<F5>', require 'dap'.continue)
            vim.keymap.set('n', '<F10>', require 'dap'.step_over)
            vim.keymap.set('n', '<F11>', require 'dap'.step_into)
            vim.keymap.set('n', '<F12>', require 'dap'.step_out)
            vim.keymap.set('n', '<leader>b', require 'dap'.toggle_breakpoint)

            -- Configuring icons for breakpoints
            vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
            vim.fn.sign_define('DapStopped', { text = '▶️', texthl = '', linehl = '', numhl = '' })
        end
    },
}

