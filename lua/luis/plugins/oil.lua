return {
    {
        "stevearc/oil.nvim",
        config = function()
            require("oil").setup({
                columns = {
                    "icon",
                    "size",
                },

            })
        end,
    },
}
