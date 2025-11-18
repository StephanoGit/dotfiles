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
    extraConfig = ''
      set -g default-shell ${pkgs.zsh}/bin/zsh
      set -g default-command "${pkgs.zsh}/bin/zsh -l"
    '';
  };
}
