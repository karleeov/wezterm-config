local wezterm = require('wezterm')

-- Define a cyberpunk color palette
local colors = {
  -- Primary neon colors
  neon_pink = '#FF2A6D',    -- Hot pink
  neon_blue = '#05D9E8',    -- Electric blue
  neon_purple = '#B000FF',  -- Vibrant purple
  neon_green = '#39FF14',   -- Laser green
  neon_yellow = '#FFD300',  -- Cyber yellow
  
  -- Secondary neon colors
  neon_orange = '#FF6C11',  -- Electric orange
  neon_cyan = '#01FFF4',    -- Bright cyan
  neon_magenta = '#FF1B8D', -- Electric magenta
  neon_red = '#FF003C',     -- Laser red
  neon_lime = '#CCFF00',    -- Electric lime
  
  -- Base colors
  dark_bg = '#0a0b16',      -- Deep space
  darker_bg = '#070811',    -- Void
  cyber_black = '#000507',  -- Absolute dark
  text_color = '#01FFF4',   -- Default text color (cyan)
  
  -- Accent colors
  cyber_purple = '#9D00FF',  -- Deep purple
  cyber_red = '#FF003C',     -- Blood red
  cyber_orange = '#FF5D00',  -- Burning orange
  cyber_teal = '#00FFC8'     -- Matrix green
}

-- Event handler to update the right status with cyberpunk styling
wezterm.on('update-right-status', function(window, pane)
  -- Get current date/time
  local date = wezterm.strftime('%Y-%m-%d %H:%M')
  
  -- Create a cyberpunk-style status
  window:set_right_status(wezterm.format({
    { Foreground = { Color = colors.neon_blue } },
    { Text = '󰖟 ' },  -- System icon
    { Foreground = { Color = colors.neon_magenta } },
    { Text = date .. ' ' },
    { Foreground = { Color = colors.neon_green } },
    { Text = '⚡' },  -- Power icon
  }))
end)

local config = {}

-- Performance settings
config.animation_fps = 60
config.max_fps = 120
config.front_end = 'WebGpu'
config.webgpu_power_preference = 'HighPerformance'

-- Font configuration
config.font = wezterm.font_with_fallback({
  { family = "JetBrainsMono Nerd Font", weight = "Medium" },
  { family = "Fira Code", weight = "Medium" },
  { family = "Segoe UI", weight = "Medium" },
})
config.font_size = 11
config.line_height = 1.2
config.cell_width = 1.0
config.underline_thickness = 3
config.underline_position = -4

-- Window appearance
config.window_padding = {
  left = 20,
  right = 20,
  top = 20,
  bottom = 20,
}
config.window_background_opacity = 0.90
config.text_background_opacity = 0.95
config.window_decorations = "RESIZE"
config.window_close_confirmation = 'NeverPrompt'

-- Cursor settings
config.default_cursor_style = 'BlinkingBar'
config.cursor_blink_rate = 400
config.force_reverse_video_cursor = true

-- Tab bar settings
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true
config.tab_max_width = 25
config.show_tab_index_in_tab_bar = false
config.switch_to_last_active_tab_when_closing_tab = true

-- Color scheme configuration
config.colors = {
  -- The default text color
  foreground = colors.text_color,
  -- The default background color
  background = colors.dark_bg,
  
  -- Cursor colors
  cursor_bg = colors.neon_magenta,
  cursor_fg = colors.cyber_black,
  cursor_border = colors.neon_magenta,
  
  -- Selection colors
  selection_fg = colors.cyber_black,
  selection_bg = colors.neon_cyan,
  
  -- The color of the scrollbar "thumb"
  scrollbar_thumb = colors.cyber_purple,
  
  -- The color of the split lines between panes
  split = colors.neon_blue,
  
  -- ANSI colors
  ansi = {
    colors.cyber_black,      -- Black
    colors.cyber_red,        -- Red
    colors.neon_green,       -- Green
    colors.neon_yellow,      -- Yellow
    colors.neon_blue,        -- Blue
    colors.neon_magenta,     -- Magenta
    colors.neon_cyan,        -- Cyan
    colors.text_color,       -- Bright text (instead of white)
  },
  
  -- Bright ANSI colors
  brights = {
    colors.darker_bg,        -- Bright black
    colors.neon_orange,      -- Bright red
    colors.neon_lime,        -- Bright green
    colors.neon_yellow,      -- Bright yellow
    colors.neon_cyan,        -- Bright blue
    colors.neon_purple,      -- Bright magenta
    colors.cyber_teal,       -- Bright cyan
    colors.neon_blue,        -- Bright text (instead of white)
  },

  -- Tab bar colors
  tab_bar = {
    background = colors.darker_bg,
    active_tab = {
      bg_color = colors.cyber_black,
      fg_color = colors.neon_magenta,
      intensity = "Bold",
      underline = "Single",
      italic = false,
    },
    inactive_tab = {
      bg_color = colors.darker_bg,
      fg_color = colors.neon_cyan,
      italic = true,
    },
    inactive_tab_hover = {
      bg_color = colors.dark_bg,
      fg_color = colors.neon_purple,
      italic = true,
    },
    new_tab = {
      bg_color = colors.darker_bg,
      fg_color = colors.neon_green,
    },
    new_tab_hover = {
      bg_color = colors.dark_bg,
      fg_color = colors.neon_blue,
      italic = true,
    },
  },
}

-- Shell configuration
local powershell_dir = 'C:/Program Files/PowerShell/7/pwsh.exe'
local fallback_powershell = 'C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe'

-- Check if PowerShell 7 exists, otherwise use Windows PowerShell
local function get_powershell()
  local success, _ = wezterm.run_child_process({"cmd.exe", "/c", "where", powershell_dir})
  if success then
    return powershell_dir
  end
  return fallback_powershell
end

-- Default to Arch Linux WSL
config.default_prog = { 'wsl.exe', '--distribution', 'Arch', '--exec', '/bin/zsh' }

-- Exit behavior
config.exit_behavior = "Hold"
config.clean_exit_codes = {0, 130}

-- Enhanced key bindings
config.keys = {
  -- Basic operations
  { action = wezterm.action.CopyTo 'Clipboard', mods = 'CTRL', key = 'C' },
  { action = wezterm.action.PasteFrom 'Clipboard', mods = 'CTRL', key = 'V' },
  { action = wezterm.action.DecreaseFontSize, mods = 'CTRL', key = '-' },
  { action = wezterm.action.IncreaseFontSize, mods = 'CTRL', key = '=' },
  { action = wezterm.action.ResetFontSize, mods = 'CTRL', key = '0' },
  { action = wezterm.action.ToggleFullScreen, key = 'F11' },
  { action = wezterm.action.ReloadConfiguration, mods = 'CTRL|SHIFT', key = 'R' },
  
  -- Tab management
  { action = wezterm.action.SpawnTab 'CurrentPaneDomain', mods = 'CTRL|SHIFT', key = 't' },
  { action = wezterm.action.CloseCurrentTab{ confirm = false }, mods = 'CTRL|SHIFT', key = 'w' },
  { action = wezterm.action.ActivateTabRelative(-1), mods = 'CTRL', key = 'PageUp' },
  { action = wezterm.action.ActivateTabRelative(1), mods = 'CTRL', key = 'PageDown' },
  
  -- Pane management
  { action = wezterm.action.SplitVertical{ domain = 'CurrentPaneDomain' }, mods = 'CTRL|SHIFT', key = '-' },
  { action = wezterm.action.SplitHorizontal{ domain = 'CurrentPaneDomain' }, mods = 'CTRL|SHIFT', key = '\\' },
  { action = wezterm.action.ActivatePaneDirection 'Left', mods = 'CTRL|SHIFT', key = 'h' },
  { action = wezterm.action.ActivatePaneDirection 'Right', mods = 'CTRL|SHIFT', key = 'l' },
  { action = wezterm.action.ActivatePaneDirection 'Up', mods = 'CTRL|SHIFT', key = 'k' },
  { action = wezterm.action.ActivatePaneDirection 'Down', mods = 'CTRL|SHIFT', key = 'j' },
  
  -- Shell shortcuts
  { action = wezterm.action.SpawnCommandInNewTab { args = { get_powershell() } }, mods = 'CTRL|SHIFT', key = 'p' },
  { action = wezterm.action.SpawnCommandInNewTab { args = { 'wsl.exe', '--distribution', 'Arch' } }, mods = 'CTRL|SHIFT', key = 'l' },
}

-- Set working directory to user's home
config.default_cwd = wezterm.home_dir

return config