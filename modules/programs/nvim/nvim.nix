{ pkgs, ... }:
{
    programs.neovim = {
        enable = true;
        defaultEditor = true;

        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;

        plugins = with pkgs.vimPlugins; [
            {
                plugin = tokyonight-nvim;
                type = "lua";
                config = "vim.cmd[[colorscheme tokyonight]]";
            }
            {
                plugin = lualine-nvim;
                type = "lua";
                config = (builtins.readFile ./plugin/lualine-nvim.lua);
            }
            {
                plugin = nvim-treesitter.withAllGrammars;
                type = "lua";
                config = (builtins.readFile ./plugin/nvim-treesitter.lua);
            }
            {
                plugin = mini-nvim;
                type = "lua";
                config = (builtins.readFile ./plugin/mini-nvim.lua);
            }
            {
                plugin = nvim-tree-lua;
                type = "lua";
                config = (builtins.readFile ./plugin/nvim-tree.lua);
            }
            {
                plugin = telescope-nvim;
                type = "lua";
                config = (builtins.readFile ./plugin/telescope.lua);
            }
            which-key-nvim
            telescope-fzf-native-nvim
            vim-tmux-navigator
        ];

        extraLuaConfig = ''
            ${builtins.readFile ./setting/options.lua}
            ${builtins.readFile ./setting/keymaps.lua}
        '';
    };
}
