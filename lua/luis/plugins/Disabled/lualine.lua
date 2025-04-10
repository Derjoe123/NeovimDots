-- status line
return {
    {
        enabled = false,
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", 'AndreM222/copilot-lualine' },
        options = { theme = {} },
        config = function()
            require("lualine").setup(
                {
                    options = {
                        icons_enabled = true,
                        component_separators = { left = '', right = '' },
                        section_separators = { left = '', right = '' }, --{ left = '', right = '' },
                        disabled_filetypes = {},
                        always_divide_middle = true
                    },
                    sections = {
                        lualine_a = { 'mode' },
                        lualine_b = { 'buffers', 'diff',
                            {
                                'diagnostics',
                                sources = { "nvim_diagnostic" },
                                symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }
                            }
                        },
                        lualine_c = { 'filename' },
                        lualine_x = { 'searchcount', 'selectioncount', 'fileformat', 'filetype' }, -- I added copilot here
                        lualine_y = { 'lsp_status' },
                        lualine_z = { 'location' }
                    },
                    inactive_sections = {
                        lualine_a = {},
                        lualine_b = {},
                        lualine_c = { 'filename' },
                        lualine_x = { 'location' },
                        lualine_y = {},
                        lualine_z = {}
                    },
                    tabline = {},
                    extensions = {}
                }
            )
        end,
    },
}
