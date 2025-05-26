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
    update_focused_file = {
        enable = true;
    },
})

local keymap = vim.keymap

keymap.set("n", "<leader>e", "<Nop>", { desc = "NvimTree" })
keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "toggle" })
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapseKeepBuffers<CR>", { desc = "collapse, keep buffers open" })

keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "refresh" })

