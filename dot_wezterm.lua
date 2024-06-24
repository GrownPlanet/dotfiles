local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- font
config.font = wezterm.font 'caskaydiacove nerd font'

-- font size
config.font_size = 11

-- one dark :D
config.colors = {
  background =  '#282c34',
  foreground = '#abb2bf',
  ansi = {
    '#1e2127',
    '#e06c75',
    '#98c379',
    '#d19a66',
    '#61afef',
    '#c678dd',
    '#56b6c2',
    '#abb2bf',
  },
  brights = {
    '#5c6370',
    '#e06c75',
    '#98c379',
    '#d19a66',
    '#61afef',
    '#c678dd',
    '#56b6c2',
    '#ffffff',
  },
  cursor_fg =  '#282c34',
  cursor_bg = '#abb2bf',
  cursor_border =  '#abb2bf',
}

-- transparent background
config.window_background_opacity = 0.9

-- no tab bar, tmux all the way
config.enable_tab_bar = false

-- set title bar
wezterm.on("format-window-title", function()
  return "wezterm :)"
end)

return config
