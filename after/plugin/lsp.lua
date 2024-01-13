local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
  local nmap = function(keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end

    vim.keymap.set("n", keys, func, { buffer = bufnr, remap = false, desc = desc })
  end

  nmap("gd", vim.lsp.buf.definition, "Goto Definition")
  nmap("K", vim.lsp.buf.hover, "Hover Documentation")
  nmap("gD", vim.lsp.buf.declaration, "Goto Declaration")
  vim.keymap.set({ "n", "v" }, "<localleader>f", function()
    require("conform").format({ async = true, lsp_fallback = true })
  end, { desc = "format" })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = { "tsserver", "html" },
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require("lspconfig").lua_ls.setup(lua_opts)
    end,
  }
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  sources = {
    { name = "path" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
  },
  formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
  }),
})
