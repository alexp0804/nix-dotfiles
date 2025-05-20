local servers = {
    'clangd',
    'pyright',
    'html', 'cssls', 'jsonls', 'eslint',
    'vim_ls',
    'lua_ls',
    'nil_ls',
}

for _, server in ipairs(servers) do
    vim.lsp.enable(server)
end
