return {
    {
        'echasnovski/mini.nvim',
        version = '*',
        config = function()
            require('mini.pairs').setup()
            require('mini.files').setup()
            require('mini.git').setup()
        end,
    },
}
