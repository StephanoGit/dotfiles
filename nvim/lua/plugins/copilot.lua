require('copilot').setup({
  suggestion = {
    enabled = true,
    auto_trigger = true,
    keymap = {
      accept = "<Tab>",
      accept_word = false,
      accept_line = false,
      next = "<C-.>",
      prev = "<C-,>",
      dismiss = "<C-e>",
    },
  },
  panel = {
    enabled = true,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<Leader>cp",
    },
  },
})
