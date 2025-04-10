vim.g.mapleader = " "

--Oil.nvim
vim.keymap.set('n', '<leader>e', '<CMD>Oil --float<CR>', { desc = 'float file manager' })
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'open file manager' })

-- Clear search highlights after pressing escape
vim.keymap.set('n', '<ESC>', ':noh<CR>', { desc = 'reset find highlighting' })

-- unbind Shift + Up/Down arrow keys
vim.keymap.set('n', '<S-k>', '<CMD>:m -2 <CR>', { desc = 'move current line up' })
vim.keymap.set('n', '<S-j>', '<CMD>:m +1 <CR>', { desc = 'move current line down' })
-- for visual mode
vim.keymap.set('x', '<S-k>', ":m '<-2<CR>gv=gv", { desc = 'move selected lines up' })
vim.keymap.set('x', '<S-j>', ":m '>+1<CR>gv=gv", { desc = 'move selected lines down' })

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
        vim.keymap.set("n", "[d", function()
            vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
        end, { buffer = e.buf, desc = 'next error' })

        vim.keymap.set("n", "]d", function()
            vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
        end, { buffer = e.buf, desc = 'previous error' })
    end
})
