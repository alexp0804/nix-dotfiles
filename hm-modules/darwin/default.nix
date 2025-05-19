# darwin module is meant for things that are specific to the macbook.
# things like macOS options like dock size/autohide, finder options, etc.
# also for programs only needed on macbook, like karabiner (key remaps), aeorspace (tiling wm)
{
    imports = [
        ./dock.nix
        ./finder.nix
        ./karabiner.nix
        ./misc.nix
        ./sketchybar.nix
        ./aerospace.nix
    ];
}
