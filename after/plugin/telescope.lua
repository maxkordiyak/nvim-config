local telescope_builtin = require("telescope.builtin")

-- general search
-- Telescope live_grep in git root
-- Function to find the git root directory based on the current buffer's path
local function find_git_root()
  -- Use the current buffer's path as the starting point for the git search
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir
  local cwd = vim.fn.getcwd()
  -- If the buffer is not associated with a file, return nil
  if current_file == "" then
    current_dir = cwd
  else
    -- Extract the directory from the current file's path
    current_dir = vim.fn.fnamemodify(current_file, ":h")
  end

  -- Find the Git root directory from the current file's path
  local git_root = vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
  if vim.v.shell_error ~= 0 then
    print("Not a git repository. Searching on current working directory")
    return cwd
  end
  return git_root
end

-- Custom live_grep function to search in git root
local function live_grep_git_root()
  local git_root = find_git_root()
  if git_root then
    require("telescope.builtin").live_grep({
      search_dirs = { git_root },
    })
  end
end

vim.api.nvim_create_user_command("LiveGrepGitRoot", live_grep_git_root, {})

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>?", telescope_builtin.man_pages, { desc = "[?] Find in help" })
vim.keymap.set("n", "<leader><space>", telescope_builtin.buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  telescope_builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, { desc = "Search Files" })
vim.keymap.set("n", "<leader>fa", function() telescope_builtin.find_files({ no_ignore = true, hidden = true }) end,
  { desc = "Find all files" })
vim.keymap.set("n", "<leader>fh", telescope_builtin.help_tags, { desc = "Search Help" })
vim.keymap.set("n", "<leader>fw", telescope_builtin.grep_string, { desc = "Search current Word" })
vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep, { desc = "Search by Grep" })
vim.keymap.set("n", "<leader>fG", ':LiveGrepGitRoot<cr>', { desc = "Search by Grep on Git Root" })
vim.keymap.set("n", "<leader>fd", telescope_builtin.diagnostics, { desc = "Search Diagnostics" })
vim.keymap.set("n", "<leader>fr", telescope_builtin.resume, { desc = "Search Resume" })
vim.keymap.set("n", "<leader>fc", telescope_builtin.commands, { desc = "Search Commands" })
vim.keymap.set("n", "<leader>fy", telescope_builtin.symbols, { desc = "Search emoji/symbols" })
vim.keymap.set("n", "<leader>fo", telescope_builtin.oldfiles, { desc = "Find recently opened files" })

vim.keymap.set("n", "<leader>ft", telescope_builtin.treesitter, { desc = "Search Treesitter" })
vim.keymap.set("n", "gr", telescope_builtin.lsp_references, { desc = "Goto References" })
vim.keymap.set("n", "gI", telescope_builtin.lsp_implementations, { desc = "Goto Implementation" })
vim.keymap.set("n", "<leader>D", telescope_builtin.lsp_type_definitions, { desc = "Type Definition" })
vim.keymap.set("n", "<leader>ds", telescope_builtin.lsp_document_symbols, { desc = "Document Symbols" })

-- [g] GIT KEYBINDINGS

vim.keymap.set("n", "<leader>gf", telescope_builtin.git_files, { desc = "Search Git Files" })
vim.keymap.set("n", "<leader>gc", telescope_builtin.git_commits, { desc = "Git Commits" })
vim.keymap.set("n", "<leader>gb", telescope_builtin.git_branches, { desc = "Git Branches" })
vim.keymap.set("n", "<leader>gs", telescope_builtin.git_status, { desc = "Git Status" })

-- [t] Toggle
vim.keymap.set("n", "<leader>tb", "<cmd>GitBlameToggle<cr>", { desc = "Toggle git [b]lame" })

local telescope = require("telescope");
local actions = require("telescope.actions")
telescope.setup({
  defaults = {
    layout_strategy = "vertical",
    history = {
      mappings = {
        i = {
          ["<C-j>"] = actions.cycle_history_next,
          ["<C-k>"] = actions.cycle_history_prev,
        },
      },
    },
  },
})
