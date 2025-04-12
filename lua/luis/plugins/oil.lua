return {
    {
        "stevearc/oil.nvim",
        enabled = true,
        config = function()
            require("oil").setup({
                columns = {
                    "icon",
                    "size",
                    "mtime",
                },
                view_options = {
                    show_hidden = true,
                },
            })
        end,
    },
}
