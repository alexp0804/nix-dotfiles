{ pkgs, lib, ... }:
let
    getLuaFilePaths = dir:
        builtins.filter (path: lib.strings.hasSuffix ".lua" path)
        (lib.filesystem.listFilesRecursive dir);

    concatFileContents = files:
        lib.strings.concatMapStringsSep "\n" (file: builtins.readFile file) files;

    readLuaFileContents = dir:
        concatFileContents (getLuaFilePaths dir);

    pluginConfigs = readLuaFileContents ./plugin;
    settingConfigs = readLuaFileContents ./setting;
in
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
            ripgrep # telescope dependency

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
            local ok, _ = pcall(vim.cmd, 'colorscheme tokyonight')
            if not ok then
              vim.cmd 'colorscheme default'
            end
            ${settingConfigs}
            ${pluginConfigs}
        '';
    };
}
