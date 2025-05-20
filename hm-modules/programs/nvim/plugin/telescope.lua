local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
    defaults = {
        path_display = { "smart" },
        mappings = {
            i = {
                ["<Up>"] = actions.move_selection_previous,
                ["<Down>"] = actions.move_selection_next,
            },
        },
    },
})

telescope.load_extension("fzf")

local keymap = vim.keymap

keymap.set("n", "<leader>f", "<Nop>", { desc = "Telescope (search)" }) -- for which-key entry
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "find files" })
keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "find git files" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "find recent files" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "find string" })
keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", { desc = "find string under cursor" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "open buffers" })
keymap.set("n", "<leader>fc", "<cmd>Telescope commands<cr>", { desc = "available commands" })
keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "key remaps" })
keymap.set("n", "<leader>f&", "<cmd>Telescope registers<cr>", { desc = "registers" })
