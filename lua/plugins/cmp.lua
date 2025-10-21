return {
  {
    'L3MON4D3/LuaSnip',
      dependencies = {
        'saadparwaiz1/cmp_luasnip',
        "rafamadriz/friendly-snippets",
      }
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local ls = require("luasnip")
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node
      local d = ls.dynamic_node
      local f = ls.function_node
      local extras = require("luasnip.extras")
      local rep = extras.rep
      local cmp = require'cmp'
      require("luasnip.loaders.from_vscode").lazy_load()
      -- Optionnel : mappages pour naviguer dans les snippets
      local ls = require("luasnip")

      --      vim.keymap.set({"i"}, "<CR>", function() ls.expand() end, {silent = true})
      vim.keymap.set({"i", "s"}, "<Tab>", function() ls.jump( 1) end, {silent = true})
      vim.keymap.set({"i", "s"}, "<S-Tab>", function() ls.jump(-1) end, {silent = true})

      vim.keymap.set({"i", "s"}, "<C-E>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, {silent = true})

      ls.add_snippets("python", {
       s("bbb", {
        t({"After expanding, the cursor is here ->"}), i(1),
        t({"", "After jumping forward once, cursor is here ->"}), i(2),
        t({"", "After jumping once more, the snippet is exited there ->"}), i(0),
        }),
        s("aaa", {
          t("def "), i(1, "function_name"), t("("), i(2, "args"), t(", "), i(3, "arg2"), t({ ")", "" }),
          t("  "), i(0),
       }),
        s("print(", {
          t("print("),
          t('"'), i(1, "var"), t(':", '),
          rep(1),  -- répète exactement ce qui a été tapé dans l'insert node 1
          t(")"),
          i(0),
        }),
      })

      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-u>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ['<C-e>'] = cmp.mapping.abort(),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For luasnip users.
          { name = "path" },
        }, {
          { name = 'buffer' },
        }),
      })
    end,
  },
}
