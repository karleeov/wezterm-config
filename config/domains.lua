local wezterm = require 'wezterm'

local wsl_domains = wezterm.default_wsl_domains()

return {
  wsl_domains = {
    {
      name = 'WSL:Arch',
      distribution = 'Arch',
      username = 'karleeov',
      default_cwd = '/home/karleeov',
      default_prog = { 'fish', '-l' },
    },
    {
      name = 'WSL:Ubuntu22',
      distribution = 'Ubuntu-22.04',
      username = 'karleeov',
      default_cwd = '/home/karleeov',
      default_prog = { 'bash', '-l' },
    },
  },

  default_prog = { 'wsl.exe', '--distribution', 'Arch', '--cd', '~' },

  font = wezterm.font("FiraCode Nerd Font Mono"),
  font_size = 12,
  color_scheme = 'Builtin Solarized Dark',

  launch_menu = {
    {
      label = 'PowerShell',
      args = { 'powershell.exe', '-NoLogo' },
    },
  },

  keys = {
    { action = wezterm.action.CopyTo 'Clipboard', mods = 'CTRL', key = 'C' },
    { action = wezterm.action.PasteFrom 'Clipboard', mods = 'CTRL', key = 'V' },
    { action = wezterm.action.DecreaseFontSize, mods = 'CTRL', key = '-' },
    { action = wezterm.action.IncreaseFontSize, mods = 'CTRL', key = '=' },
    { action = wezterm.action.Nop, mods = 'ALT', key = 'Enter' },
    { action = wezterm.action.ResetFontSize, mods = 'CTRL', key = '0' },
    { action = wezterm.action.ToggleFullScreen, key = 'F11' },
    
    -- New shortcut for splitting the tab horizontally
    { action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" }, mods = 'CTRL', key = '-' },
    
    -- New shortcut for splitting the tab vertically
    { action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" }, mods = 'CTRL', key = '|' },

    -- New shortcut for opening a new tab for Arch
    { action = wezterm.action_callback(function(window, pane)
        window:perform_action(wezterm.action.SpawnCommandInNewTab {
          args = {'wsl', '--distribution', 'Arch'}
        }, pane)
      end), mods = 'CTRL|SHIFT', key = 'A' },
    
    -- New shortcut for opening a new tab for Ubuntu
    { action = wezterm.action_callback(function(window, pane)
        window:perform_action(wezterm.action.SpawnCommandInNewTab {
          args = {'wsl', '--distribution', 'Ubuntu-22.04'}
        }, pane)
      end), mods = 'CTRL|SHIFT', key = 'W' },
    
    -- New shortcut for opening a new tab for PowerShell
    { action = wezterm.action_callback(function(window, pane)
        window:perform_action(wezterm.action.SpawnCommandInNewTab {
          args = {'pwsh-preview'}
        }, pane)
      end), mods = 'CTRL|SHIFT', key = 'P' },
  },
}