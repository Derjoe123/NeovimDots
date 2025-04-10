return {
    {
        "stevearc/oil.nvim",
        enabled = false,
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
