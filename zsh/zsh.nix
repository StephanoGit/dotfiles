{
	
	programs.zsh = {
		enable = true;
		autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
		initContent = ''
		    alias c="clear"
		    # eval "$(direnv hook zsh)"
		'';

    # enableAutosuggestions = true;
		# enableFastSyntaxHighlighting = true;
		# enableFzfCompletion = true;
		# shellInit = ''
		#     alias c="clear"
		#     eval "$(direnv hook zsh)"
		# '';
	};

  programs.fzf.enableZshIntegration = true;
}
