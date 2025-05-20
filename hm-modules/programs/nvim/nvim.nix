{ pkgs, ... }:
{
    programs.neovim = {
        enable = true;
        defaultEditor = true;

        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;

        # Language servers
        extraPackages = with pkgs; [
            libclang
            pyright
            vscode-langservers-extracted # html, css, json, eslint, md
            vim-language-server
            lua-language-server

            # nix
            nil
            nixpkgs-fmt
        ];

        plugins = with pkgs.vimPlugins; [
            tokyonight-nvim
            lualine-nvim
            nvim-tree-lua
            telescope-nvim
            telescope-fzf-native-nvim
            mini-nvim
            which-key-nvim
            vim-tmux-navigator
            nvim-treesitter.withAllGrammars
            nvim-lspconfig
        ];

        extraLuaConfig = ''
            ${builtins.readFile ./setting/options.lua}
            ${builtins.readFile ./setting/keymaps.lua}
            vim.cmd[[colorscheme tokyonight]]

            ${builtins.readFile ./plugin/lualine-nvim.lua}
            ${builtins.readFile ./plugin/nvim-tree.lua}
            ${builtins.readFile ./plugin/telescope.lua}
            ${builtins.readFile ./plugin/mini-nvim.lua}
            ${builtins.readFile ./plugin/nvim-treesitter.lua}
            ${builtins.readFile ./plugin/nvim-lspconfig.lua}
        '';
    };
}
