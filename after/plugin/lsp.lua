local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end

    vim.keymap.set("n", keys, func, { buffer = bufnr, remap = false, desc = desc })
  end

  nmap("gd", vim.lsp.buf.definition, "Goto Definition")
  nmap("K", vim.lsp.buf.hover, "Hover Documentation")
  nmap("gD", vim.lsp.buf.declaration, "Goto Declaration")
  nmap("<localleader>a", vim.lsp.buf.code_action, "Code Action")
  nmap("<localleader>m", vim.lsp.buf.rename, "Rename")
  nmap("<F2>", vim.lsp.buf.rename, "Rename")
  vim.keymap.set({ "n", "v" }, "<F3>", vim.lsp.buf.format, { desc = "LSP: Format" })
  vim.keymap.set({ "n", "v" }, "<localleader>f", function()
    require("conform").format({ async = true, lsp_fallback = true })
  end, { desc = "format" })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'lua_ls', 'rust_analyzer'},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
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
