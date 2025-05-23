return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")
            harpoon:setup()
            vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end,
                { desc = 'add current buffer to harpoon' })
            vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
                { desc = 'toggle harpoon float' })
            -- clear the list
            vim.keymap.set("n", "<C-x>",
                function()
                    if harpoon.ui.win_id ~= nil then
                        harpoon:list():clear()
                        harpoon.ui:toggle_quick_menu(harpoon:list())
                    end
                end, { desc = 'clear harpoon list' })

            -- Toggle previous & next buffers stored within Harpoon list
            vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = 'harpoon previous in list' })
            vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = 'harpoon next in list' })
            -- basic telescope configuration
            --[[ local conf = require("telescope.config").values
            local function toggle_telescope(harpoon_files)
                local file_paths = {}
                for _, item in ipairs(harpoon_files.items) do
                    table.insert(file_paths, item.value)
                end

                require("telescope.pickers").new({}, {
                    prompt_title = "Harpoon",
                    finder = require("telescope.finders").new_table({
                        results = file_paths,
                    }),
                    previewer = conf.file_previewer({}),
                    sorter = conf.generic_sorter({}),
                }):find()
            end

            vim.keymap.set("n", "<leader>h", function() toggle_telescope(harpoon:list()) end,
                { desc = "Open harpoon window" }) ]]
        end,
    }
}
