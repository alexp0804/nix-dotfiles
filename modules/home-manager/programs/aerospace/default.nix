{ ... }:
{
    services.aerospace = {
        enable = true;

        settings = {
            gaps = {
                inner.horizontal = 4;
                inner.vertical = 4;
                outer.left = 4;
                outer.bottom = 4;
                outer.top = 4;
                outer.right = 4;
            };

            on-window-detected = [
                {
                    "if" = {
                        app-id = "com.googlecode.iterm2";
                        app-name-regex-substring = "iTerm2";
                        during-aerospace-startup = true;
                    };
                    run = [ "move-node-to-workspace 1" ];
                }
                {
                    "if" = {
                        app-id = "com.google.Chrome";
                        app-name-regex-substring = "Google Chrome";
                        during-aerospace-startup = true;
                    };
                    run = [ "move-node-to-workspace 2" ];
                }
                {
                    "if" = {
                        app-id = "com.hnc.Discord";
                        app-name-regex-substring = "Discord";
                        during-aerospace-startup = true;
                    };
                    run = [ "move-node-to-workspace 3" ];
                }
                {
                    "if" = {
                        app-id = "com.spotify.client";
                        app-name-regex-substring = "Spotify";
                        during-aerospace-startup = true;
                    };
                    run = [ "move-node-to-workspace 4" ];
                }
            ];

            mode.main.binding = {
                alt-h = "focus left";
                alt-j = "focus down";
                alt-k = "focus up";
                alt-l = "focus right";

                alt-shift-h = "move left";
                alt-shift-j = "move down";
                alt-shift-k = "move up";
                alt-shift-l = "move right";

                alt-f = "fullscreen --no-outer-gaps";
                alt-shift-f = "macos-native-fullscreen";

                alt-shift-space = "layout floating tiling";

                alt-1 = "workspace 1";
                alt-2 = "workspace 2";
                alt-3 = "workspace 3";
                alt-4 = "workspace 4";
                alt-5 = "workspace 5";
                alt-6 = "workspace 6";
                alt-7 = "workspace 7";
                alt-8 = "workspace 8";
                alt-9 = "workspace 9";
                alt-0 = "workspace 0";

                alt-shift-1 = "move-node-to-workspace 1";
                alt-shift-2 = "move-node-to-workspace 2";
                alt-shift-3 = "move-node-to-workspace 3";
                alt-shift-4 = "move-node-to-workspace 4";
                alt-shift-5 = "move-node-to-workspace 5";
                alt-shift-6 = "move-node-to-workspace 6";
                alt-shift-7 = "move-node-to-workspace 7";
                alt-shift-8 = "move-node-to-workspace 8";
                alt-shift-9 = "move-node-to-workspace 9";
                alt-shift-0 = "move-node-to-workspace 0";

                alt-r = "mode resize";
            };

            mode.resize.binding = {
                h = "resize width -50";
                j = "resize height +50";
                k = "resize height -50";
                l = "resize width +50";

                enter = "mode main";
                esc = "mode main";
                alt-r = "mode main";
            };
        };
    };
}
