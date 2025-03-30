return {
    "zaldih/themery.nvim",
    enabled = true,
    lazy = false,
    config = function()
        require("themery").setup({
            themes = { "gruvbox", "catppuccin", "tokyonight" }, -- Your list of installed colorschemes.
            livePreview = true,                                 -- Apply theme while picking. Default to true.
        })
    end
}
