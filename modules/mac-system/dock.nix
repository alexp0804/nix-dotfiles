{ pkgs, ... }:
{
    system = {
        defaults = {
            dock = {
                persistent-apps = [
                    {
                        app = "/System/Applications/System Settings.app";
                    }
                    {
                        app = "${pkgs.google-chrome}/Applications/Google Chrome.app";
                    }
                    {
                        app = "${pkgs.iterm2}/Applications/iTerm2.app";
                    }
                    {
                        app = "${pkgs.obsidian}/Applications/Obsidian.app";
                    }
                    {
                        app = "${pkgs.spotify}/Applications/Spotify.app";
                    }
                    {
                        app = "${pkgs.discord}/Applications/Discord.app";
                    }
                ];

                autohide = true;
                minimize-to-application = true; # apps minimize into their icon instead of separate section
                mru-spaces = false; # disable rearranging spaces based on most recent use
                show-recents = false;
                tilesize = 64;
                wvous-tl-corner = 4; # top left corner action is show desktop
            };
        };
    };
}
