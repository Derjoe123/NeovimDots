vim.g.mapleader = " "

local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end


-- Save
-- map("n", "<leader>w", "<CMD>update<CR>")

-- Quit
-- map("n", "<leader>q", "<CMD>q<CR>")
-- Clear search highlights after pressing escape
map("n", "<ESC>", ":noh<CR>")

-- Exit insert mode
-- map("i", "jk", "<ESC>")
-- NeoTree
map("n", "<leader>e", "<CMD>Oil --float<CR>")
map("n", "-", "<CMD>Oil<CR>")

-- New Windows
-- map("n", "<leader>o", "<CMD>vsplit<CR>")
-- map("n", "<leader>p", "<CMD>split<CR>")

-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- Resize Windows
--map("n", "<C-Left>", "<C-w><")
--map("n", "<C-Right>", "<C-w>>")
--map("n", "<C-Up>", "<C-w>+")
--map("n", "<C-Down>", "<C-w>-")
--map("n", "<C-Down>", "<C-w>-")
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,
})

local job_id = 0
vim.keymap.set("n", "<space>to", function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 15)

    job_id = vim.bo.channel
end)

local current_command = ""
vim.keymap.set("n", "<space>te", function()
    current_command = vim.fn.input("Command: ")
end)

vim.keymap.set("n", "<space>tr", function()
    if current_command == "" then
        current_command = vim.fn.input("Command: ")
    end

    vim.fn.chansend(job_id, { current_command .. "\r\n" })
end)
