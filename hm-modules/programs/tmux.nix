# terminal multiplexer
{ pkgs, ... }:
{
    programs.tmux = {
        enable = true;
        baseIndex = 1;
        mouse = true;
        prefix = "C-Space";
        terminal = "screen-256color";
        keyMode = "vi";
        historyLimit = 10000;

        plugins = with pkgs.tmuxPlugins; [
            sensible
            vim-tmux-navigator # use ctrl+hjkl to navigate between nvim and tmux panes
            yank # clipboard integration
            pain-control # for better pane splitting/resizing shortcuts
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

            # rename window to current program
            setw -g automatic-rename on

            set -g default-command ${pkgs.zsh}/bin/zsh
        '';
    };
}
