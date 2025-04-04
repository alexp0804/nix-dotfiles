{ pkgs, ... }:
{
    services = {
        yabai = {
            enable = false;
            config = {
                focus_follows_mouse = "on";
                mouse_follows_focus = "off";
                window_placement = "second_child";
                window_shadow = "on";
                window_opacity = "off";
                window_opacity_duration = "0.1";
                active_window_opacity = "1.0";
                normal_window_opacity = "0.80";
                window_border = "off";
                split_ratio = "0.50";
                auto_balance = "on";
                mouse_modifier = "fn";
                mouse_action1 = "move";
                mouse_action2 = "resize";
                mouse_drop_action = "swap";
                layout = "bsp";

                top_padding = "3";
                bottom_padding = "3";
                left_padding = "3";
                right_padding = "3";
                window_gap = "3";
            };
        };
    };
}
