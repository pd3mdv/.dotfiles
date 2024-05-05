return {
  'salkin-mada/openscad.nvim',
  config = function ()
    require('openscad')
    -- load snippets, note requires
    vim.g.openscad_load_snippets = true
  end,
  requires = 'L3MON4D3/LuaSnip'
}
