return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Define the keymap to open the dashboard manually
    vim.api.nvim_set_keymap("n", "<leader>h", ":Alpha<CR>", { noremap = true, silent = true })

    -- Header Color Highlight
    vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#d65d0e" })
    dashboard.section.header.opts.hl = "DashboardHeader"

    -- Header ASCII Art
    dashboard.section.header.val = {
      [[                                                                        ]],
      [[        ███████████            █████      ██                     ]],
      [[       ███████████               █████                             ]],
      [[       ████████████████ ███████████ ███   ███████      ]],
      [[      ████████████████ ████████████ █████ ██████████████   ]],
      [[     █████████████████████████████ █████ █████ ████ █████   ]],
      [[   ██████████████████████████████████ █████ █████ ████ █████  ]],
      [[  ██████  ███ █████████████████ ████ █████ █████ ████ ██████ ]],
      [[  ██████   ██  ███████████████   ██ █████████████████ ]],
      [[  ██████   ██   ███████████████   ██ █████████████████ ]],
    }

    -- Menu Buttons
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

    -- Finalize and Setup Alpha
    alpha.setup(dashboard.opts)
  end
}
