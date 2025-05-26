{ pkgs, ... }:
{
    # use touchId instead of password
    security.pam.services.sudo_local.touchIdAuth = true;

    # this allows touchId to be used inside tmux sessions
    environment = {
        etc."pam.d/sudo_local".text = ''
                    # Managed by Nix Darwin
                    auth       optional       ${pkgs.pam-reattach}/lib/pam/pam_reattach.so ignore_ssh
                    auth       sufficient     pam_tid.so
        '';
    };
}
