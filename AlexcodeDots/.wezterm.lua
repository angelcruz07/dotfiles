-- Pull in the wezterm API
local wezterm = require("wezterm")

-- Initialize the configuration
local config = {}

-- Use the config_builder for better error messages if available
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Active color scheme: Catppuccin Mocha
config.color_scheme = "Catppuccin Mocha"

-- Commented configuration: Kanagawa color scheme
-- Uncomment this block if you want to use Kanagawa instead of Catppuccin Mocha
-- config.colors = {
--   foreground = "#dcd7ba",
--   background = "#181616",
--
--   cursor_bg = "#c8c093",
--   cursor_fg = "#c8c093",
--   cursor_border = "#c8c093",
--
--   selection_fg = "#c8c093",
--   selection_bg = "#2d4f67",
--
--   scrollbar_thumb = "#16161d",
--   split = "#16161d",
--
--   ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
--   brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
--   indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
-- }

-- Window padding for a cleaner look
config.window_padding = {
	top = 0,
	right = 0,
	left = 0,
}

-- Additional configurations
config.window_background_opacity = 0.80
config.font = wezterm.font("IosevkaTerm NF")
config.hide_tab_bar_if_only_one_tab = true
config.font_size = 18

-- Uncomment this block if running on Windows with WSL
-- config.default_domain = "WSL:Ubuntu"
-- config.front_end = "OpenGL"

-- Return the final configuration
return config
