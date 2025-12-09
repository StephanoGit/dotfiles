{
  services.skhd = {
    enable = true;
    skhdConfig = ''
      			  # Say hello shortcut
              cmd + shift - h : say "I'm VERY hungry Aaron let's get some food ASAP!!!"
      			  cmd + shift - a : say "sugi pula aaron!"
                      	
      			  cmd - g : open -a "/Applications/Ghostty.app"
      			  cmd - m : open -a "/Applications/Spotify.app"

              # Remap Shift + 3 to produce # instead of £
              shift - 3 : skhd -t "#"	
      		'';
  };
}
