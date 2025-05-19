# secure shell. hosts configs for my remote server and pi.
{ pkgs, ... }:
{
    programs.ssh = {
        enable = true;
        matchBlocks = {
            "raspberrypi" = {
                hostname = "192.168.4.28";
                user = "alexp";
                port = 22;
            };
            "ocl" = {
                hostname = "129.146.60.149";
                user = "opc";
                identityFile = "~/.ssh/ocl/ssh-key-2025-02-16.key";
            };
        };
    };
}
