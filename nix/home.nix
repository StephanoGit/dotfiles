{config, pkgs, ...} : {
  home.username = "stephano";
  home.homeDirectory = "/Users/stephano";
  home.stateVersion = "25.11";

  imports = [
    ../nvim/nvim.nix
    ../zsh/zsh.nix
];


  home.packages = [

  ];

  home.file = {

  };

}
