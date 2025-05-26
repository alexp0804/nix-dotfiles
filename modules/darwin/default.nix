{ pkgs, ... }:
{
    imports = [
        ./appearance.nix
        ./display.nix
        ./dock.nix
        ./finder.nix
        ./input.nix
        ./security.nix
    ];
}
