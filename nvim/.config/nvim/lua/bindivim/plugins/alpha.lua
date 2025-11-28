return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      "                                                                    ",
      "  888 88b, 888 Y88b Y88 888 88e   888 Y8b Y88888P 888     e   e     ",
      "  888 88P' 888  Y88b Y8 888 888b  888  Y8b Y888P  888    d8b d8b    ",
      "  888 8K   888 b Y88b Y 888 8888D 888   Y8b Y8P   888   e Y8b Y8b   ",
      "  888 88b, 888 8b Y88b  888 888P  888    Y8b Y    888  d8b Y8b Y8b  ",
      "  888 88P' 888 88b Y88b 888 88\"   888     Y8P     888 d888b Y8b Y8b ",
      "                                                                    ",
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("SPC e", "  > Toggle file explorer", "<cmd>Ex<CR>"),
      dashboard.button("SPC sf", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC sg", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
