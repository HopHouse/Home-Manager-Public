{ config, pkgs, ... }:

{
  # zsh
  programs.zsh = {
    enable = true;
    syntaxHighlighting = {
      enable = true;
    };
    #enableAutosuggestions = true;
    #enableCompletion = true;
    initExtra = ''
      # Launch tmux unless already inside one
      #if [ "$TMUX" = "" ]; then tmux; fi

      DISABLE_UNTRACKED_FILES_DIRTY="true"
    '';
    oh-my-zsh = {
      enable = true;
      #plugins = [ "git" "docker-compose" "docker" ];
      theme = "agnoster";
      #theme = "amuse";
      #theme = "crunch";
      #theme = "fino-time";
    };
    shellAliases = {
      #vim = "nvim";
    };
  };

  # tmux
  programs.tmux = {
    enable = true;
    mouse = true;
    keyMode = "vi";
    clock24 = true;
    sensibleOnTop = true;
    plugins = with pkgs; [
      tmuxPlugins.cpu
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '60' # minutes
        '';
      }
      tmuxPlugins.sensible
      tmuxPlugins.copycat
      tmuxPlugins.yank
      tmuxPlugins.sessionist
      tmuxPlugins.logging
      tmuxPlugins.sensible
      {
        plugin = tmuxPlugins.dracula;
        extraConfig = ''
          set -g @dracula-plugins "cpu-usage gpu-usage ram-usage network network-vpn time battery"
          #set -g @dracula-plugins "cpu-usage gpu-usage ram-usage network network-vpn weather time battery"
          set -g @dracula-refresh-rate 2
          set -g @dracula-show-left-icon session
          set -g @dracula-show-empty-plugins false
          set -g @dracula-show-powerline true
          #set -g @dracula-fixed-location "Paris, France"
          set -g @dracula-show-location false
          set -g @dracula-show-fahrenheit false
          set -g @dracula-military-time true
          set -g @dracula-day-month true
        '';
      }
    ];
  };

  # fzf
  programs.fzf = rec {
    enable = true;
    defaultCommand = "${pkgs.lib.getExe pkgs.fd} -H --type f";
    defaultOptions = [ "--height 50%" ];
    fileWidgetCommand = "${defaultCommand}";
    fileWidgetOptions = [
      "--preview '${pkgs.lib.getExe pkgs.bat} --color=always --plain --line-range=:200 {}'"
    ];
    changeDirWidgetCommand = "${pkgs.lib.getExe pkgs.fd} -H --type d";
    changeDirWidgetOptions = [ "--preview '${pkgs.tree}/bin/tree -C {} | head -200'" ];
    historyWidgetOptions = [ ];
  };


}
