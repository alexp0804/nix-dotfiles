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

local keymap = vim.keymap

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        opts.desc = "Show LSP references"
        keymap.set("n", "gD", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Go to declaration"
        keymap.set("n", "gd", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>dd", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts)
    end,
})

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " 󰠠",
            [vim.diagnostic.severity.INFO] = " ",
        }
    }
})
