{ config, pkgs, ... }:
{
  home.username = "stephano";
  home.homeDirectory = "/Users/stephano";
  home.stateVersion = "25.11";

  imports = [
    ../nvim/nvim.nix
    ../zsh/zsh.nix
    ../tmux/tmux.nix
  ];

  home.packages = with pkgs; [
    lua-language-server
    pyright
    tinymist
    typst
    textlsp
    nil
  ];

  home.file = {

  };

}
