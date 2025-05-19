# programs configured for any linux environment
# like zsh, nvim, git, tmux.
{
    imports = [
        ./nvim/nvim.nix
        ./eza.nix
        ./git.nix
        ./ssh.nix
        ./tmux.nix
        ./zoxide.nix
        ./zsh.nix
    ];
}
