{ pkgs, ... }:
{
	programs.zsh = {
		enable = true;
		autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
		    eval "$(oh-my-posh init zsh)"
        
        alias c="clear"
        
        alias ls="eza --icons always -a"
        alias la="eza --icons always -la"
        alias ll="eza --icons always -ll"

		    # eval "$(direnv hook zsh)"
		'';
  };
  programs.fzf.enableZshIntegration = true;

  home.packages = [
    pkgs.oh-my-posh
  ];

}
