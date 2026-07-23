-- Bring in our wonderful configs
local wezterm = require 'wezterm'
local themes = require 'themes'
local general = require 'general'
local fonts = require 'fonts'

-- Create a config to config
local config = wezterm.config_builder()

-- Set up our defaults
general.set_defaults(config)

-- Add our defined themes to the config and set
themes.build_themes(config)
config.color_scheme = 'gruvbox_material_dark_hard'

-- Set up our fonts
fonts.font_settings(config)

return config

