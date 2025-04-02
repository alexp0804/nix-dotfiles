-- leader key
vim.g.mapleader = " "

local keymap = vim.keymap

-- unbind arrow keys
keymap.set({"n", "v", "i"}, "<Up>", "<Nop>")
keymap.set({"n", "v", "i"}, "<Left>", "<Nop>")
keymap.set({"n", "v", "i"}, "<Right>", "<Nop>")
keymap.set({"n", "v", "i"}, "<Down>", "<Nop>")

-- clear search highlight, two options
keymap.set("n", "<Esc><Esc>", "<Esc>:nohlsearch<cr><Esc>")
keymap.set("n", "<CR>", ":noh<CR><CR>")

-- move highlighted text
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- yank til end of line
keymap.set("n", "Y", "yg$")

-- dont move cursor when joining lines
keymap.set("n", "J", "mzJ`z")

-- center screen on cursor when scrolling or searching
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- jump to placeholder (<++>) and enter insert mode
keymap.set("n", "<leader><space>", "/<++><CR>c4l", { desc = "Jump to placeholder (<++>) and replace" })

-- creating panes
keymap.set("n", "<leader>s", "<Nop>", { desc = "Panes" })   -- for which-key description
keymap.set("n", "<leader>s-", "<C-w>v", { desc = "Split pane veritcally" })
keymap.set("n", "<leader>s\\", "<C-w>s", { desc = "Split pane horizontally" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close pane" })

-- resizing panes
keymap.set("n", "<leader>S>", "20<C-w>>", { desc = "Inc. pane horizontal size" })
keymap.set("n", "<leader>S<", "20<C-w><", { desc = "Dec. pane horizontal size" })
keymap.set("n", "<leader>S+", "20<C-w>+", { desc = "Inc. pane veritcal size" })
keymap.set("n", "<leader>S-", "20<C-w>-", { desc = "Dec. pane veritcal size" })
keymap.set("n", "<leader>S=", "<C-w>=", { desc = "Equalize pane size" })
