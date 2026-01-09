require("sidekick").setup({
  -- add any options here
  cli = {
    mux = {
      backend = "tmux", -- or "tmux" if you use tmux
      enabled = true,
    },
  },
})

-- Keybindings for sidekick
vim.keymap.set("n", "<Tab>", function()
  if not require("sidekick").nes_jump_or_apply() then
    return "<Tab>" -- fallback to normal tab
  end
end, { expr = true, desc = "Goto/Apply Next Edit Suggestion" })

vim.keymap.set({ "n", "t", "i", "x" }, "<C-.>", function()
  require("sidekick.cli").toggle()
end, { desc = "Sidekick Toggle" })

vim.keymap.set("n", "<leader>aa", function()
  require("sidekick.cli").toggle()
end, { desc = "Sidekick Toggle CLI" })

vim.keymap.set("n", "<leader>as", function()
  require("sidekick.cli").select()
end, { desc = "Select CLI" })

vim.keymap.set("n", "<leader>ad", function()
  require("sidekick.cli").close()
end, { desc = "Detach CLI Session" })

vim.keymap.set({ "x", "n" }, "<leader>at", function()
  require("sidekick.cli").send({ msg = "{this}" })
end, { desc = "Send This" })

vim.keymap.set("n", "<leader>af", function()
  require("sidekick.cli").send({ msg = "{file}" })
end, { desc = "Send File" })

vim.keymap.set("x", "<leader>av", function()
  require("sidekick.cli").send({ msg = "{selection}" })
end, { desc = "Send Visual Selection" })

vim.keymap.set({ "n", "x" }, "<leader>ap", function()
  require("sidekick.cli").prompt()
end, { desc = "Sidekick Select Prompt" })
