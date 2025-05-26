# Packages to be on any system regardless of OS
{ pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        neovim
        tmux
        git

        wget
        curl
        coreutils

        gcc         # C devel tools
        glib
        gnumake
        clang-tools
        bear

        zoxide      # better cd
        eza         # better ls
        bat         # better cat
        btop        # better top
        duf         # better df
        dust        # better du
        fd          # better find
        ripgrep     # better grep
        gawk
        gnused
        tldr
        fzf

        neofetch
        sl
    ];
}
