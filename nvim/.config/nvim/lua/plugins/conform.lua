-- Conform Configuration
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "gofmt", "goimports" },
    json = { "jq" },
  },
  format_on_save = { timeout_ms = 500, lsp_fallback = true },
})

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
  require("conform").format({ lsp_fallback = true, async = false, timeout_ms = 1000 })
end, { desc = "Format file or range" })
