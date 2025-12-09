{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    initContent = ''
      # Plugins
      eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/zen.toml)"
      eval "$(fzf --zsh)"
      eval "$(zoxide init --cmd cd zsh)"
      eval "$(direnv hook zsh)"
      eval "$(ssh-add ~/.ssh/github-key)"


      # Aliases
      alias c="clear"              
      alias ls="eza --icons always -a"
      alias la="eza --icons always -la"
      alias ll="eza --icons always -ll"

      # Keybindings
      bindkey -e
      bindkey '^p' history-search-backward
      bindkey '^n' history-search-forward

      # History
      HISTSIZE=5000
      HISTFILE=~/.zsh_history
      SAVEHIST=$HISTSIZE
      HISTDUP=erase
      setopt appendhistory
      setopt sharehistory
      setopt hist_ignore_space
      setopt hist_ignore_all_dups
      setopt hist_save_no_dups
      setopt hist_ignore_dups
      setopt hist_find_no_dups

      # Completion styling
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' menu no
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
      zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
    '';
  };
  programs.fzf.enableZshIntegration = true;
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  home.packages = [
    pkgs.oh-my-posh
    pkgs.fzf
    pkgs.zoxide
  ];

}
