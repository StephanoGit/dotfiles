-- inline diagnostic
vim.diagnostic.config({
  virtual_text = true;
  signs = true;
  underline = true;
  update_in_insert = false;
  severity_sort = true;
})

-- python
vim.lsp.enable("pyright")

-- lua
vim.lsp.enable("lua_ls")


vim.lsp.enable("tinymist")
vim.lsp.config("tinymist", {
  on_attach = function(_, _)
    vim.keymap.set("n", "<leader>tp", ":TypstPreviewToggle<CR>", { noremap = true, silent = false})
  end
})

require("typst-preview").setup({
  open_cmd = "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome --app=%s "
})


