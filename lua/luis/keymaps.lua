vim.g.mapleader = " "

--Oil.nvim
vim.keymap.set('n', '<leader>e', '<CMD>Oil --float<CR>', { desc = 'float file manager' })
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'open file manager' })

-- Clear search highlights after pressing escape
vim.keymap.set('n', '<ESC>', ':noh<CR>', { desc = 'reset find highlighting' })

-- unbind Shift + Up/Down arrow keys
vim.keymap.set('n', '<S-k>', '<CMD>:m -2 <CR>', { desc = 'move current line up' })
vim.keymap.set('n', '<S-j>', '<CMD>:m +1 <CR>', { desc = 'move current line down' })

-- Window management
vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' })   -- Split vertical
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' }) -- Split horizontal
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' })    -- Make equal size
vim.keymap.set('n', '<leader>sx', ':close<CR>', { desc = 'Close current split' })   -- Close current split

-- More ergonomic window movement
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to window below' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to window above' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(e)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { buffer = e.buf, desc = 'go to definition' })
        vim.keymap.set("n", "<leader>k", function() vim.lsp.buf.hover() end,
            { buffer = e.buf, desc = 'Hover definition' })
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,
            { buffer = e.buf, desc = 'workspace symbol' })
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
            { buffer = e.buf, desc = 'float diagnostics' })
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,
            { buffer = e.buf, desc = 'code action' })
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end,
            { buffer = e.buf, desc = 'symbol references' })
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end,
            { buffer = e.buf, desc = 'rename symbol' })
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
            { buffer = e.buf, desc = 'function signature helper' })
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end,
            { buffer = e.buf, desc = 'next error/warning' })
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end,
            { buffer = e.buf, desc = 'previous error/warning' })
    end
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
end, { desc = 'open new terminal' })

local current_command = ""
vim.keymap.set("n", "<space>te", function()
    current_command = vim.fn.input("Command: ")
end, { desc = 'enter terminal command' }
)

vim.keymap.set("n", "<space>tr", function()
    if current_command == "" then
        current_command = vim.fn.input("Command: ")
    end

    vim.fn.chansend(job_id, { current_command .. "\r\n" })
end, { desc = 'send terminal command' }
)
