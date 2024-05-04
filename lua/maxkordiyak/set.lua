-- Add sets to make editor experience better.

vim.opt.relativenumber = true -- Relative line numbers
vim.opt.nu = true             -- Line numbers

local indent = 2;

vim.opt.expandtab = true    -- Use spaces instead of tabs
vim.opt.shiftwidth = indent -- Size of an indent
vim.opt.smartindent = true  -- Insert indents automatically
vim.opt.tabstop = indent    -- Number of spaces tabs count for

vim.opt.list = true         -- Show some invisible characters (tabs...)
vim.opt.wrap = false        -- Disable line wrap
vim.opt.number = true       -- Print line number
vim.opt.swapfile = false

vim.opt.conceallevel = 2 -- Hide * markup for bold and italic (Neorg)

