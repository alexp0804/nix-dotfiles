# terminal multiplexer
{ pkgs, ... }:
{
    programs.tmux = {
        enable = true;
        baseIndex = 1;
        mouse = true;
        prefix = "C-a";
        terminal = "screen-256color";
        keyMode = "vi";
        historyLimit = 10000;
        plugins = [
            pkgs.tmuxPlugins.sensible
            pkgs.tmuxPlugins.vim-tmux-navigator
            pkgs.tmuxPlugins.yank
            pkgs.tmuxPlugins.tokyo-night-tmux
            pkgs.tmuxPlugins.pain-control
        ];
        extraConfig = ''
            # renumber windows when another window is closed
            set -g renumber-windows on

            # rename window to current program
            setw -g automatic-rename on

            set -g default-command ${pkgs.zsh}/bin/zsh
        '';
    };
}
