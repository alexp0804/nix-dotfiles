local lualine = require("lualine")

lualine.setup {
    options = {
        theme = 'auto',                                     -- colorscheme
        component_separators = { left = '', right = ''},  -- separators between components of a single section
        section_separators = { left = '', right = ''},    -- separators between sections
        globalstatus = false,                               -- if set to true then use only one statusline for all buffers
    },
    sections = {
        lualine_a = {'mode'},                               -- current vim mode
        lualine_b = {'diff', 'diagnostics'},                -- git diff, errors/warnings from LSP
        lualine_c = {'filename'},                           -- file name
        lualine_x = {'encoding', 'filetype'},               -- e.g. utf-8, lua
        lualine_y = {'searchcount'},                        -- number of search results when searching
        lualine_z = {'location'}                            -- line number, col number
    },
    inactive_sections = {                                   -- what sections should remain active when the buffer is not focused
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'filetype'},
    },
    extensions = {
        'nvim-tree',                                       -- custom rules for NvimTree
    },
}
