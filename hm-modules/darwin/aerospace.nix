{ pkgs, ... }:
{
    services.aerospace = {
        enable = true;

        settings = {
            gaps = {
                inner.horizontal = 8;
                inner.vertical = 8;
                outer.left = 8;
                outer.bottom = 8;
                outer.top = 8;
                outer.right = 8;
            };

            mode.main.binding = {
                alt-h = "focus left";
                alt-j = "focus down";
                alt-k = "focus up";
                alt-l = "focus right";

                alt-shift-h = "move left";
                alt-shift-j = "move down";
                alt-shift-k = "move up";
                alt-shift-l = "move right";

                alt-f = "fullscreen";
                alt-shift-space = "layout floating tiling";

                alt-1 = "workspace 1";
                alt-2 = "workspace 2";
                alt-3 = "workspace 3";
                alt-4 = "workspace 4";
                alt-5 = "workspace 5";

                alt-shift-1 = "move-node-to-workspace 1";
                alt-shift-2 = "move-node-to-workspace 2";
                alt-shift-3 = "move-node-to-workspace 3";
                alt-shift-4 = "move-node-to-workspace 4";
                alt-shift-5 = "move-node-to-workspace 5";

                alt-r = "mode resize";
            };

            mode.resize.binding = {
                h = "resize width -50";
                j = "resize height +50";
                k = "resize height -50";
                l = "resize width +50";
                enter = "mode main";
                esc = "mode main";
            };
        };
    };
}
