{
	programs.zsh = {
		enable = true;
		autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
		initContent = ''
		    alias c="clear"
        
        alias ls="eza --icons always -a"
        alias la="eza --icons always -la"
        alias ll="eza --icons always -ll"

		    # eval "$(direnv hook zsh)"
		'';
	};
  programs.fzf.enableZshIntegration = true;
}
