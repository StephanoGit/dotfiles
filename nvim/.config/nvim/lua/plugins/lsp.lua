return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "chomosuke/typst-preview.nvim",
  },
  config = function()
    -- 1. Initialize Mason (Downloads the binaries)
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "pyright", "lua_ls", "jsonls", "tinymist" }
    })

    -- 2. Your Original on_attach Logic
    local on_attach = function(_, bufnr)
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, noremap = true, silent = true })
    end

    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })

    -- 3. Nvim 0.11+ Native Setup (Restored from your Nix config)
    
    -- Python
    vim.lsp.config("pyright", { on_attach = on_attach })
    vim.lsp.enable("pyright")

    -- Lua
    vim.lsp.config("lua_ls", {
      on_attach = on_attach,
      settings = { Lua = { diagnostics = { globals = { "vim" } } } }
    })
    vim.lsp.enable("lua_ls")

    -- JSON
    vim.lsp.config("jsonls", {
      on_attach = on_attach,
      settings = { json = { validate = { enable = true } } }
    })
    vim.lsp.enable("jsonls")

    -- Typst
    vim.lsp.config("tinymist", {
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        vim.keymap.set("n", "<leader>tp", ":TypstPreviewToggle<CR>", { buffer = bufnr, silent = false })
      end
    })
    vim.lsp.enable("tinymist")

    -- Typst Preview Setup
    require("typst-preview").setup({
      open_cmd = "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome --app=%s "
    })
  end
}
