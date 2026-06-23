-- Telescope Configuration
local telescope = require("telescope")
telescope.setup({
  defaults = {
    mappings = {
      i = { ["<C-j>"] = "move_selection_next", ["<C-k>"] = "move_selection_previous" },
    },
    path_display = { "truncate" },
  },
})

pcall(telescope.load_extension, "fzf")

-- Keymaps
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
