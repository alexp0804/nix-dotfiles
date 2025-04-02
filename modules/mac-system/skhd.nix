{ pkgs, ... }:
{
    services = {
        skhd = {
            enable = true;
            skhdConfig =
                let
                    yabai = "${pkgs.yabai}/bin/yabai";
                in
                    ''
# Navigation
alt - h : ${yabai} -m window --focus west
alt - j : ${yabai} -m window --focus south
alt - k : ${yabai} -m window --focus north
alt - l : ${yabai} -m window --focus east

# Moving windows
shift + alt - h : ${yabai} -m window --warp west
shift + alt - j : ${yabai} -m window --warp south
shift + alt - k : ${yabai} -m window --warp north
shift + alt - l : ${yabai} -m window --warp east

# Move focus container to workspace
shift + alt - 1 : ${yabai} -m window --space 1
shift + alt - 2 : ${yabai} -m window --space 2
shift + alt - 3 : ${yabai} -m window --space 3
shift + alt - 4 : ${yabai} -m window --space 4
shift + alt - 5 : ${yabai} -m window --space 5

# Resize windows
ctrl + shift - h : \
                    ${yabai} -m window --resize left:-100:0 ; \
                    ${yabai} -m window --resize right:-100:0

ctrl + shift - j : \
                    ${yabai} -m window --resize bottom:0:100 ; \
                    ${yabai} -m window --resize top:0:100

ctrl + shift - k : \
                    ${yabai} -m window --resize top:0:-100 ; \
                    ${yabai} -m window --resize bottom:0:-100

ctrl + shift - l : \
                    ${yabai} -m window --resize right:100:0 ; \
                    ${yabai} -m window --resize left:100:0

# Rotate windows
# alt - r : ${yabai} -m space --rotate 270
# shift + alt - r: ${yabai} -m space --rotate 90

# Float and center window
shift + alt - c : ${yabai} -m window --toggle float;\
                    ${yabai} -m window --grid 4:4:1:1:2:2

# Float / Unfloat window
shift + alt - space : ${yabai} -m window --toggle float

# Make fullscreen
alt - f : ${yabai} -m window --toggle zoom-fullscreen

# Change desktop
ctrl - 1 : ${yabai} -m space --focus 1
ctrl - 2 : ${yabai} -m space --focus 2
ctrl - 3 : ${yabai} -m space --focus 3
ctrl - 4 : ${yabai} -m space --focus 4
ctrl - 5 : ${yabai} -m space --focus 5

# Launch common applications
# cmd - return : open -a /Applications/iTerm.app/Contents/MacOS/iTerm2
# cmd + shift - return : open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome
                '';
        };
    };
}
