local wezterm = require('wezterm')
local colors = require('colors.custom')

local neon_blue = '#00FFFF'

return {
  animation_fps = 60,
  max_fps = 60,
  front_end = 'WebGpu',
  webgpu_power_preference = 'HighPerformance',

  -- color scheme
  color_scheme = 'Cyberpunk',
  colors = {
    foreground = neon_blue,
    background = colors.background,
  },

  -- background
  background = {
    {
      source = { File = wezterm.GLOBAL.background },
      horizontal_align = 'Center',
    },
    {
      source = { Color = colors.background },
      height = '100%',
      width = '100%',
      opacity = 0.9,
    },
  },

  -- scrollbar
  enable_scroll_bar = false, -- Set to false for performance

  -- tab bar
  enable_tab_bar = true, -- Set to false if you don't need tabs often
  hide_tab_bar_if_only_one_tab = true, -- Only show when multiple tabs are open
  use_fancy_tab_bar = false,
  tab_max_width = 25,
  show_tab_index_in_tab_bar = false,
  switch_to_last_active_tab_when_closing_tab = true,

  -- window
  window_padding = {
    left = 5,
    right = 10,
    top = 12,
    bottom = 7,
  },
  window_close_confirmation = 'NeverPrompt',
  window_frame = {
    active_titlebar_bg = '#090909',
  },
  inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.65,
  },

  -- Key bindings for switching between different shells and distributions
  keys = {
    { action = wezterm.action.CopyTo 'Clipboard', mods = 'CTRL', key = 'C' },
    { action = wezterm.action.PasteFrom 'Clipboard', mods = 'CTRL', key = 'V' },
    { action = wezterm.action.DecreaseFontSize, mods = 'CTRL', key = '-' },
    { action = wezterm.action.IncreaseFontSize, mods = 'CTRL', key = '=' },
    { action = wezterm.action.Nop, mods = 'ALT', key = 'Enter' },
    { action = wezterm.action.ResetFontSize, mods = 'CTRL', key = '0' },
    { action = wezterm.action.ToggleFullScreen, key = 'F11' },
    { action = wezterm.action_callback(function(window, pane)
        window:perform_action(wezterm.action.SpawnCommandInNewTab {
          args = {'wsl', '--distribution', 'Ubuntu-24.04'}
        }, pane)
      end), mods = 'CTRL|SHIFT', key = 'O' },
    { action = wezterm.action_callback(function(window, pane)
        window:perform_action(wezterm.action.SpawnCommandInNewTab {
          args = {'wsl', '--distribution', 'Arch'}
        }, pane)
      end), mods = 'CTRL|SHIFT', key = 'A' },
    { action = wezterm.action_callback(function(window, pane)
        window:perform_action(wezterm.action.SpawnCommandInNewTab {
          args = {'wsl', '--distribution', 'Debian'}
        }, pane)
      end), mods = 'CTRL|SHIFT', key = 'D' },
    { action = wezterm.action_callback(function(window, pane)
        window:perform_action(wezterm.action.SpawnCommandInNewTab {
          args = {'pwsh-preview'}
        }, pane)
      end), mods = 'CTRL|SHIFT', key = 'P' },
    { action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }, mods = 'CTRL|SHIFT', key = '-' },
    { action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }, mods = 'CTRL|SHIFT', key = '|' },
  },
}