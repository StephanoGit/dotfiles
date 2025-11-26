local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local devicons = require("nvim-web-devicons")

vim.api.nvim_set_keymap("n", "<leader>h", ":Alpha<CR>", { noremap = true, silent = true })

vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#d65d0e" })
-- vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#fe8019" })
dashboard.section.header.opts.hl = "DashboardHeader"


-- Set header
dashboard.section.header.val = {
  -- "                                                     ",
  -- "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  -- "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  -- "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  -- "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  -- "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  -- "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  -- "                                                     ",
  [[                                                                     ]],
  [[       ███████████           █████      ██                     ]],
  [[      ███████████             █████                             ]],
  [[      ████████████████ ███████████ ███   ███████     ]],
  [[     ████████████████ ████████████ █████ ██████████████   ]],
  [[    █████████████████████████████ █████ █████ ████ █████   ]],
  [[  ██████████████████████████████████ █████ █████ ████ █████  ]],
  [[ ██████  ███ █████████████████ ████ █████ █████ ████ ██████ ]],
  [[ ██████   ██  ███████████████   ██ █████████████████ ]],
  [[ ██████   ██  ███████████████   ██ █████████████████ ]],
}

-- Set menu
dashboard.section.buttons.val = {
  dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", "  > Find file", ":Telescope find_files<CR>"),
  dashboard.button("r", "  > Recent files", ":Telescope oldfiles<CR>"),
  dashboard.button("n", "  > PhD Notes", ":e $HOME/Documents/PhD/Notes <CR>"),
  dashboard.button("v", "  > NeoVim .config", ":e $HOME/.config/nvim <CR>"),
  dashboard.button("c", "󰀶  > PopOS .config", ":e $HOME/.config <CR>"),
  dashboard.button("q", "  > Quit NeoVim", ":qa<CR>"),
}

-- Footer Text
dashboard.section.footer.val = "Have a productive day!"

-- Send config to alpha
alpha.setup(dashboard.opts)
