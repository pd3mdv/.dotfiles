return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon add mark"})
    keymap.set("n", "<C-e>", ui.toggle_quick_menu)

    keymap.set("n", "<C-1>", function() ui.nav_file(1) end)
    keymap.set("n", "<C-2>", function() ui.nav_file(2) end)
    keymap.set("n", "<C-3>", function() ui.nav_file(3) end)
    keymap.set("n", "<C-4>", function() ui.nav_file(4) end)

  end,
}
