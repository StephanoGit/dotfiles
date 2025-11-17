{
	services.skhd = {
		enable = true;
		skhdConfig = ''
			  # Say hello shortcut
        cmd + shift - h : say "hello there!"

			  cmd + shift - a : say "sugi pula aaron!"
                	
			  cmd - g : open -a "/Applications/Ghostty.app"

        # Remap Shift + 3 to produce # instead of £
        shift - 3 : skhd -t "#"	
		'';
	};
}
