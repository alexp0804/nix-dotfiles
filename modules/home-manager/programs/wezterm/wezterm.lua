local wezterm = require 'wezterm'

-- local tabline = wezterm.plugin.require('https://github.com/michaelbrusegard/tabline.wez')

local config = wezterm.config_builder()
local act = wezterm.action

-- I am using wayland, but setting this to true causes glitchy behavior
config.enable_wayland = false
config.scrollback_lines = 10000

config.mouse_bindings = {
    {
        event = { Down = { streak = 1, button = "Right" } },
        mods = "NONE",
        action = wezterm.action_callback(function(window, pane)
            local has_selection = window:get_selection_text_for_pane(pane) ~= ""
            if has_selection then
                window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
                window:perform_action(act.ClearSelection, pane)
            else
                window:perform_action(act({ PasteFrom = "Clipboard" }), pane)
            end
        end),
    },
}


-- appearances
config.color_scheme = 'Tokyo Night'
config.font_size = 14
config.window_decorations = 'RESIZE'

-- tabs
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_max_width = 32

config.audible_bell = 'Disabled'

return config
