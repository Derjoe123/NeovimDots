return {
    {
        'echasnovski/mini.nvim',
        version = '*',
        config = function()
            require('mini.pairs').setup()
            require('mini.icons').setup()
            --require('mini.files').setup()
            require('mini.git').setup()
            require('mini.diff').setup()
            require('mini.statusline').setup()
            require('mini.surround').setup()
            require('mini.comment').setup()
        end,
    },
}
