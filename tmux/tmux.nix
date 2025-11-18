{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      yank
      gruvbox
      vim-tmux-navigator
      tmux-floax
      sensible
    ];
  };
}
