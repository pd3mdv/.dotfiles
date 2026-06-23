-- Treesitter Syntax Highlighting Configuration
require("nvim-treesitter").setup({
  ensure_installed = {
    "lua", "vim", "vimdoc", "query", "json", "go", "markdown", "markdown_inline", "bash", "yaml",
  },
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
})
