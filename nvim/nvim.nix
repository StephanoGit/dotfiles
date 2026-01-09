{
  pkgs,
  system,
  inputs,
  ...
}:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      nodejs_24
    ];

    plugins =
      (with pkgs.vimPlugins; [
        lualine-nvim
        image-nvim
        nvim-notify
        gruvbox-nvim
        telescope-fzf-native-nvim
        nvim-cmp
        cmp-nvim-lsp
        cmp-nvim-lua
        nvim-lspconfig
        cmp-buffer
        cmp-path
        cmp-cmdline
        none-ls-nvim
        nvim-web-devicons
        oil-nvim
        alpha-nvim
        lazygit-nvim
        vim-fugitive
        rustaceanvim
        nvim-ufo
        FTerm-nvim
        neo-tree-nvim
        noice-nvim
        nvim-treesitter.withAllGrammars
        nvim-treesitter-textobjects
        nvim-treesitter-textsubjects
        lexima-vim
        hex-nvim
        asyncrun-vim
        vim-floaterm
        nvim-surround
        leap-nvim
        typst-vim
        typst-preview-nvim
        vim-be-good
        sidekick-nvim
        copilot-lua
        copilot-lsp
        copilot-lualine
      ])
      ++ (with pkgs.luajitPackages; [
        magick
      ]);
  };
}
