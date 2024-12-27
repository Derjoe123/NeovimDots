return {
    "zaldih/themery.nvim",
    enabled = false,
    lazy = false,
    config = function()
        require("themery").setup({
            themes = {"tokyonight", "gruvbox", "onedark"}, -- Your list of installed colorschemes.
            livePreview = true, -- Apply theme while picking. Default to true.
        })
    end
  }
