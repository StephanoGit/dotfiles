{
  services.skhd = {
    enable = true;
    skhdConfig = ''
      			  # Say hello shortcut
              cmd + shift - h : say "I'm VERY hungry Aaron let's get some food ASAP!!!"
      			  cmd + shift - a : say "sugi pula aaron!"
              
              # Apps shortcuts        	
      			  cmd - g : open -a "/Applications/Ghostty.app"
      			  # cmd - m : open -a "/Applications/Spotify.app"
              cmd - m : /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --app=https://open.spotify.com
             

              # Remap Shift + 3 to produce # instead of £
              shift - 3 : skhd -t "#"	
      		'';
  };
}
