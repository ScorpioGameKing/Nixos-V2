local wezterm = require 'wezterm'

local module = {}

function module.set_defaults(config)

    -- This is a fix, disable wayland support or it will not run on wayland
    config.enable_wayland = false

    -- Never prompt me again plese
    config.window_close_confirmation = 'NeverPrompt'

    -- Set A new working are, rows don't matter as much when tiling
    config.initial_cols = 120
    config.initial_rows = 28

    -- Splits > tabs, fight me
    config.enable_tab_bar = false
end

return module
