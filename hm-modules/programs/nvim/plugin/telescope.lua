local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
    defaults = {
        path_display = { "smart" },
        mappings = {
            i = {
                ["<Up>"] = actions.move_selection_previous,
                ["<Down>"] = actions.move_selection_next,
                ["<C-z>"] = actions.select_vertical,
            },
        },
    },
})

telescope.load_extension("fzf")

local keymap = vim.keymap

keymap.set("n", "<leader>f", "<Nop>", { desc = "Telescope (search)" }) -- for which-key entry
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Telescope find files" })
keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "Telescope find git files" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Telescope find recent files" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Telescope find string" })
keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", { desc = "Telescope find string under cursor" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Telescope open buffers" })
keymap.set("n", "<leader>fc", "<cmd>Telescope commands<cr>", { desc = "Telescope available commands" })
keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Telescope key remaps" })
keymap.set("n", "<leader>f&", "<cmd>Telescope registers<cr>", { desc = "Telescope registers" })
