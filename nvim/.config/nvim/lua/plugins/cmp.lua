return {
  "hrsh7th/nvim-cmp",
  -- Load cmp when we enter Insert mode to keep startup fast
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- completion from LSP
    "hrsh7th/cmp-buffer",   -- completion from current buffer
    "hrsh7th/cmp-path",     -- completion for file paths
    "hrsh7th/cmp-cmdline",  -- completion for the search/command bar
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
      }, {
        { name = "buffer" },
      }),
    })

    -- Optional: setup for command line (:) and search (/)
    -- This uses the cmp-cmdline and cmp-path dependencies added above
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })
  end,
}
