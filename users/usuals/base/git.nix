{ config, pkgs, ... }:

{
  # Git
  programs.git = {
    enable = true;
    ignores = [
      "*~"
      "*.swp"
    ];
    aliases = {
      lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --";
    };
  };
}
