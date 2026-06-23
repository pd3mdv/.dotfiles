-- Neovim Options
local opt = vim.opt

-- Neovim 0.12 specific features
opt.autocomplete = true -- Enable native autocomplete
-- opt.ui2 = true          -- Experimental UI2 decoupling (removed as it caused errors)

-- Appearance
opt.number = true         -- Show line numbers
opt.relativenumber = true -- Relative line numbers
opt.termguicolors = true  -- True color support
opt.colorcolumn = "80"
opt.wrap = true
opt.cursorline = true  -- Highlight the current line
opt.cursorcolumn = true
opt.signcolumn = "yes" -- Always show the signcolumn
opt.showmode = false
opt.updatetime = 250
opt.timeoutlen = 300
opt.scrolloff = 10

opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Tabs & Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.breakindent = true

-- fold
vim.opt.fillchars = { fold = " " }
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.foldlevel = 99

-- Behavior
opt.mouse = "a"                  -- Enable mouse support
opt.clipboard = "unnamedplus"    -- Use system clipboard
opt.ignorecase = true            -- Ignore case in search
opt.smartcase = true             -- Override ignorecase if search has capitals
opt.splitright = true            -- Vertical splits to the right
opt.splitbelow = true            -- Horizontal splits below
opt.splitkeep = "screen"         -- Keep screen position when splitting
opt.laststatus = 3               -- Global statusline
opt.cmdheight = 0                -- Hide command line when not in use
opt.undofile = true              -- Persistent undo
vim.cmd("packadd nvim.undotree") -- Load native 0.12 visualizer
opt.inccommand = "split"

-- netrw
vim.g.netrw_banner = 0
vim.g.netrw_bufsettings = "noma nomod nu nobl nowrap ro"
vim.g.netrw_liststyle = 1

-- Fillchars for clean UI
opt.fillchars:append({
  vert = "│",
  vertleft = "│",
  vertright = "│",
  verthoriz = "┼",
})
