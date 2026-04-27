return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>e", "<cmd>Yazi<cr>",     desc = "Yazi current file" },
    { "<leader>E", "<cmd>Yazi cwd<cr>", desc = "Yazi cwd" },
  },
  opts = {
    open_for_directories = true,
    future_events = { "cd" }, -- lets yazi emit cd events back to nvim
    hooks = {
      yazi_closed_successfully = function(chosen_file, config, state)
        -- Change nvim's cwd to wherever yazi landed
        if state.last_directory then
          vim.fn.chdir(tostring(state.last_directory))
        end
      end,
    },
    keymaps = {
      show_help = "<f1>",
    },
  },
}
