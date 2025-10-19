-- lua/plugins/lsp_python.lua
return {
  {"williamboman/mason.nvim", config = true},
  {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = { "pyright" },
    })
  end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    configs = function()
      local configs = vim.lsp.configs
      local on_attach = function(client, bufnr)
        local map = function(mode, lhs, rhs)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
        end
        map("n", "gd", vim.lsp.buf.definition)
        map("n", "K", vim.lsp.buf.hover)
        map("n", "<leader>rn", vim.lsp.buf.rename)
        map("n", "<leader>ca", vim.lsp.buf.code_action)
      end

      -- 4b️⃣ capabilities pour nvim-cmp
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      configs.pyright.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,
  },
}
