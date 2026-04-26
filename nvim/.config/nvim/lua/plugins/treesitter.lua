return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  init = function()
    -- ensure_installed replacement
    local parsers = { "lua", "python", "rust", "typst", "json", "yaml", "bash", "markdown" }
    local installed = require("nvim-treesitter").get_installed()
    local to_install = vim.tbl_filter(function(p)
      return not vim.tbl_contains(installed, p)
    end, parsers)
    if #to_install > 0 then
      require("nvim-treesitter").install(to_install)
    end

    -- enable highlighting and indentation per filetype
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
}
