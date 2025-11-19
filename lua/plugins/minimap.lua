return {
  -- activate minimap :Minimap
  "wfxr/minimap.vim",
  build = "cargo install --locked code-minimap",
  config = function()
    vim.g.minimap_width = 8
  end
}

