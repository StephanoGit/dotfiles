local on_attach = function(_, bufnr)
  vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
      vim.lsp.buf.format({ async = false })
    end,
  })
end



-- inline diagnostic
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- nix
vim.lsp.enable("nil_ls")
vim.lsp.config("nil_ls", {
  on_attach = on_attach
})

-- python
vim.lsp.enable("pyright", {
  on_attach = on_attach
})

-- lua
vim.lsp.enable("lua_ls")
vim.lsp.config("lua_ls", {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
})

-- grammar checker and typst lsps
vim.lsp.enable("textlsp")
vim.lsp.enable("tinymist")
vim.lsp.config("tinymist", {
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    vim.keymap.set("n", "<leader>tp", ":TypstPreviewToggle<CR>", { noremap = true, silent = false })
  end
})

require("typst-preview").setup({
  open_cmd = "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome --app=%s "
})
