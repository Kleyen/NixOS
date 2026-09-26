{pkgs, ...}: {
  home.packages = with pkgs; [
    wget
    ghostty
    firefox
    brave
    obsidian
    bibata-cursors
    micro
    kew
    gthumb
    celluloid
    parabolic
    telegram-desktop
    btop
    flatpak
    dnsutils
    nautilus
    gnome-autoar
    file-roller
    sushi
    nodejs
    localsend
    tree
    motrix
    grc
    upscaler
    foot
    bat
    libreoffice
    onlyoffice-desktopeditors
    vlc
    vscode-fhs
    celluloid
    bitwarden-desktop
    vesktop
    scrcpy
    unimatrix
    yt-dlp
    ffmpeg
    pear-desktop
    jetbrains.webstorm



    #
    python3
    gdu
  ];
}
