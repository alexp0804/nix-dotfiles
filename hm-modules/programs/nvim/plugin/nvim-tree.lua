local nvimtree = require("nvim-tree")

-- disable netrw, use nvim-tree instead
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
    view = {
        width = 35,
        number = true,
        relativenumber = true,
    },
    renderer = {
        group_empty = true,
        indent_markers = {
            enable = true,
        },
    },
    git = {
        enable = true,
        ignore = false,
    },
})

local keymap = vim.keymap

keymap.set("n", "<leader>e", "<Nop>", { desc = "NvimTree" })
keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "NvimTree toggle" })
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "NvimTree refresh" })
keymap.set("n", "<leader>eb", "<cmd>NvimTreeCollapseKeepBuffers<CR>", { desc = "NvimTree collapse, keep buffers" })
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "NvimTree collapse" })

