return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    -- Fix for Neovim 0.10+ treesitter API breaking Telescope previewer
    if vim.treesitter.language.ft_to_lang == nil then
      vim.treesitter.language.ft_to_lang = function(ft)
        local ok, lang = pcall(vim.treesitter.language.get_lang, ft)
        return ok and lang or ft
      end
    end

    telescope.setup({
      defaults = {
        path_display = { "truncate" },
        preview = {
          treesitter = false,
        },
        mappings = {
          i = {
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            ["<C-j>"] = require("telescope.actions").move_selection_next,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- File finding
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })

    -- Content search
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
    vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Grep word under cursor" })

    -- LSP
    vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Document symbols" })
    vim.keymap.set("n", "<leader>fS", builtin.lsp_workspace_symbols, { desc = "Workspace symbols" })
    vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })

    -- Git
    vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git commits" })
    vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Git branches" })
    vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git status" })

    -- Misc
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
  end,
}
