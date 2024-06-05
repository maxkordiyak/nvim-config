-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  -- Fuzzy finder and live grep
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    config = function()
      require("telescope").setup()
    end,
    -- or                            , branch = '0.1.x',
    requires = { { "nvim-lua/plenary.nvim" } },
  })

  use("nvim-telescope/telescope-symbols.nvim")

  use("folke/tokyonight.nvim")

  use("nvim-tree/nvim-web-devicons")

  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

  use({
    "mfussenegger/nvim-lint",
    config = function()
      require("lint").linters_by_ft = {
        markdown = { "vale" },
      }
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  })

  use("tpope/vim-sleuth")

  -- File browser
  use({
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup()
    end,
  })

  use({
    "nvimdev/dashboard-nvim",
    config = function()
      require("dashboard").setup()
    end,
    requires = { "nvim-tree/nvim-web-devicons" },
  })

  use({
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    requires = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- LSP Support
      { "neovim/nvim-lspconfig" },
      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "L3MON4D3/LuaSnip" },
    },
  })

  -- Code outline window
  use({
    "stevearc/aerial.nvim",
    config = function()
      require("aerial").setup()
    end,
  })

  -- Move around fast in current buffer. Jump to specific locations
  use("ggandor/lightspeed.nvim")

  -- Manipulate surrounding characters
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  })

  -- gcc to comment out or gbc
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })

  use("stevearc/dressing.nvim")

  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end,
  })

  use({
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup()
    end,
  })

  use({
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true },
    config = function()
      require("lualine").setup()
    end,
  })

  use({
    "linrongbin16/lsp-progress.nvim",
    config = function()
      require("lsp-progress").setup()
    end,
  })

  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  })

  use({
    "f-person/git-blame.nvim",
    config = function()
      require("gitblame").setup({ enabled = false })
    end,
  })

  use("tpope/vim-fugitive")

  use({
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
    },
    config = function()
      require("neogit").setup()
    end,
  })

  use({
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup()
    end,
  })

  use("onsails/lspkind.nvim")

  use("lukas-reineke/indent-blankline.nvim")
end)
