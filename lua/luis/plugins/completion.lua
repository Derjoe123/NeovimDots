return {
    {
        'saghen/blink.compat',
        -- use the latest release, via version = '*', if you also use the latest release for blink.cmp
        version = '*',
        -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
        lazy = true,
        -- make sure to set opts so that lazy.nvim calls blink.compat's setup
        opts = {
            impersonate_nvim_cmp = true,
        },
    },
    {
        'saghen/blink.cmp',
        dependencies = 'rafamadriz/friendly-snippets',
        version = '*',
        opts = {
            -- 'default' for mappings similar to built-in completion
            -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
            -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
            -- See the full "keymap" documentation for information on defining your own keymap.
            keymap = { preset = 'enter' },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono'
            },

            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer', 'supermaven' },
                providers = {
                    supermaven = {
                        name = 'supermaven',
                        module = 'blink.compat.source',
                    },
                    copilot = {
                        name = 'copilot',
                        module = 'blink.compat.source',
                    },
                },
            },
            completion = {
                --[[ ghost_text = {
                    enabled = true,
                }, ]]
                menu = {
                    border = 'rounded',
                    scrollbar = false,
                    min_width = 20,
                    max_height = 20,
                    draw = {
                        gap = 2,
                        padding = 2,
                    },
                },
                documentation = { window = { border = 'rounded' } },
            },
            signature = { enabled = true, window = { border = 'rounded' } },
        },
        opts_extend = { "sources.default" }
    },
}
