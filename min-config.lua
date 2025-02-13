-- min-config.lua
local wezterm = require('wezterm')  -- REQUIRED MODULE IMPORT

return {
    term = 'xterm-256color',
    font = wezterm.font('JetBrainsMono Nerd Font'),
    font_size = 11,
    colors = {
        foreground = '#01FFF4',
        background = '#0a0b16',
    }
}