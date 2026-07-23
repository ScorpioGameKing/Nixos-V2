local wezterm = require 'wezterm'

local module = {}

function module.font_settings(config)
    -- Set up our font features, will move to another file later
    config.font_size = 13
    config.font = wezterm.font 'Agave Nerd Font Mono'
end

return module
