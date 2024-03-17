{ config, pkgs, ... }:

{
  programs = {
    htop.enable = true;
    less.enable = true;
    man.enable = true;
    rofi.enable = true;
    wofi.enable = true;
    zathura.enable = true;
  };

  home.packages = with pkgs; [
    # core
    cacert
    coreutils-full
    curl
    diffutils
    findutils
    gnupg

    # Utils
    file
    gawk
    jq
    rsync
    tree
    which
    sshfs

    # Syscall monitoring
    lsof
    ltrace
    strace

    # Networking
    dnsutils
    ipcalc
    nmap
    socat

    # System tools
    pciutils # lspci
    usbutils # lsusb

    # Archives
    p7zip
    unzip
    xz
    zip

    # User
    keepassxc
    libreoffice
    yubikey-manager

    # Dev
    vscodium
    git
    nix
    rustup
    #cargo
    #rustc
    #rustfmt
    gcc

    # Useful nix related tools
    #cachix # adding/managing alternative binary caches hosted by Cachix
    #niv # easy dependency management for nix projects
  ];
}
