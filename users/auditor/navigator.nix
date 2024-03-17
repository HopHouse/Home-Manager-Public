{ config, pkgs, lib, ... }:

{
  # Chromium
  programs.chromium = {
    enable = true;
    extensions = [
      # ublock origin
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; }

      # Ghostery
      { id = "mlomiejdfkolichcflejclcbmpeaniij"; }

      # Bitwarden
      { id = "nngceckbapebfimnlniiiahkandclblb"; }

      # NoScript
      { id = "doojmbjmlfjjnbmnoijecmcbfeoakpjm"; }

      # FoxyProxy Basic
      { id = "dookpfaalaaappcdneeahomimbllocnb"; }

      # GetPocket
      { id = "niloccemoadcdkdjlinkgdfekeahmflj"; }
    ];
  };

  #programs.firefox = {
  #  enable = true;
  #  profiles = {
  #    default = {
  #      id = 0;
  #      name = "default";
  #      isDefault = true;
  #      settings = {
  #        "browser.startup.homepage" = "https://start.duckduckgo.com";
  #        "browser.startup.page" = 3;
  #        "browser.search.defaultenginename" = "DuckDuckGo";
  #        "browser.search.order.1" = "DuckDuckGo";"identity.fxaccounts.enabled" = false;
  #        "privacy.trackingprotection.enabled" = true;
  #        "dom.security.https_only_mode" = true;
  #        "signon.rememberSignons" = false;
  #        "browser.topsites.blockedSponsors" = ''["amazon"]'';
  #        "browser.shell.checkDefaultBrowser" = false;
  #        "browser.shell.defaultBrowserCheckCount" = 1;
  #        "browser.disableResetPrompt" = true;
  #        };
  #      #extensions = with nur-no-pkgs.repos.rycee.firefox-addons; [
  #      #  ublock-origin
  #      #  bitwarden
  #      #  darkreader
  #      #  vimium
  #      #];
  #    };
  #  };
  #};
}
