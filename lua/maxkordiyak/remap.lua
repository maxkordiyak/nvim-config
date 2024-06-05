vim.g.mapleader = " "
vim.g.maplocalleader = ","

local map = vim.keymap.set

map("v", "J", ":m '>+1<CR>gv=gv") -- Use move command to move lines of code down when highlighted
map("v", "K", ":m '<-2<CR>gv=gv") -- Use move command to move lines of code up when highlighted
map("n", "J", "mzJ`z") -- Keep the cursor in same place after we append line below to the current line
map("n", "<C-d>", "<C-d>zz") -- Keep cursor in the middle while jumping down
map("n", "<C-u>", "<C-u>zz") -- Keep cursor in the middle while jumping up
map("n", "n", "nzzzv") -- Keep search terms in the middle
map("n", "N", "Nzzzv")

-- greatest remap ever
map("x", "<leader>p", [["_dP]])

-- Yank into the system clipoard
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>Y", '"+Y')

-- Delete into void register
map("n", "<leader>d", '"_d')
map("v", "<leader>d", '"_d')

map("i", "<C-c>", "<Esc>")

map("n", "Q", "<nop>")
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Quickfix navigation
map("n", "<C-k>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")

map("n", "<leader>k", "<cmd>lnext<CR>zz")
map("n", "<leader>j", "<cmd>lprev<CR>zz")

-- [w] WINDOW MANAGEMENT
map("n", "<leader>wh", "<C-W>h", { desc = "Go Left" })
map("n", "<leader>wj", "<C-W>j", { desc = "Go Down" })
map("n", "<leader>wk", "<C-W>k", { desc = "Go Up" })
map("n", "<leader>wl", "<C-W>l", { desc = "Go Right" })
map("n", "<leader>wH", "<C-W>H", { desc = "Move Left" })
map("n", "<leader>wJ", "<C-W>J", { desc = "Move Down" })
map("n", "<leader>wK", "<C-W>K", { desc = "Move Up" })
map("n", "<leader>wL", "<C-W>L", { desc = "Move Right" })
map("n", "<leader>w=", "<C-W>=", { desc = "Equalize" })
map("n", "<leader>w|", "<C-W>|", { desc = "Maximize Horizontally" })
map("n", "<leader>w_", "<C-W>_", { desc = "Maximize Vertically" })
map("n", "<leader>w+", "<C-W>+", { desc = "Increase Height" })
map("n", "<leader>w-", "<C-W>-", { desc = "Decrease Height" })
map("n", "<leader>w>", "<C-W>>", { desc = "Increase Width" })
map("n", "<leader>w<", "<C-W><", { desc = "Decrease Width" })
map("n", "<leader>ws", "<C-W>s", { desc = "Split Horizontally" })
map("n", "<leader>wv", "<C-W>v", { desc = "Split Vertically" })
map("n", "<leader>wo", "<C-W>o", { desc = "Close all other windows" })
map("n", "<leader>ww", "<C-W>w", { desc = "Switch window" })
map("n", "<leader>wc", "<C-W>q", { desc = "Close Window" })

-- [b] BUFFER SHORTCUTS
map("n", "<leader>bk", ":bdelete<CR>", { desc = "Kill buffer" })
map("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bb", ":Telescope buffers<CR>", { desc = "Switch buffer" })
map("n", "<leader>cf", "<cmd>edit $MYVIMRC<CR>", { desc = "open init.lua" })

-- MISC
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
