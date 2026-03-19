return {
  -- activate minimap :Minimap
  "wfxr/minimap.vim",
  build = "cargo install --locked code-minimap",
  config = function()
    vim.g.minimap_width = 8
    -- Launch minimap when enter event 
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        vim.cmd("Minimap") 
      end
    })
  end
}

