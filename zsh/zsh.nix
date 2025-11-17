{
	
	programs.zsh = {
		enable = true;
		enableAutosuggestions = true;
		enableFastSyntaxHighlighting = true;
		enableFzfCompletion = true;
		shellInit = ''
		    alias c="clear"
		    eval "$(direnv hook zsh)"
		'';
	};
}
