{ pkgs, ... }:
{
    programs.tmux = {
        enable = true;
        baseIndex = 1;
        mouse = true;
        prefix = "C-Space";
        terminal = "tmux-256color";
        keyMode = "vi";
        historyLimit = 10000;

        plugins = with pkgs.tmuxPlugins; [
            sensible
            vim-tmux-navigator
            yank
            pain-control
            {
                plugin = tokyo-night-tmux;
                extraConfig = ''
                    # disable datetime widget
                    set -g @tokyo-night-tmux_show_datetime 0
                '';
            }
        ];

        extraConfig = ''
            # renumber windows when another window is closed
            set -g renumber-windows on

            # set -g default-command ${pkgs.zsh}/bin/zsh

            set -ag terminal-overrides ",xterm-256color:RGB"
        '';
    };
}
