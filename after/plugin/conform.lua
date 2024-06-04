require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    css = { { "prettierd", "prettier" }, "stylelint" },
    html = { { "prettierd", "prettier" } },
    json = { "jq" },
    javascript = { { "prettierd", "prettier" } },
    typescript = { { "prettierd", "prettier" } },
    typescriptreact = { { "prettierd", "prettier" } },
  },
})
