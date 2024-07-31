local wezterm = require 'wezterm'

local wsl_domains = wezterm.default_wsl_domains()

return {
  -- ref: https://wezfurlong.org/wezterm/config/lua/SshDomain.html
  ssh_domains = {},

  -- ref: https://wezfurlong.org/wezterm/multiplexing.html#unix-domains
  unix_domains = {},

  -- ref: https://wezfurlong.org/wezterm/config/lua/WslDomain.html
  wsl_domains = {
    {
      name = 'WSL:Arch',
      distribution = 'Arch',
      username = 'karleeov', -- Replace with your WSL2 Arch username
      default_cwd = '/home/karleeov', -- Replace with the correct home directory
      default_prog = { 'fish', '-l' }, -- Adjust the shell if necessary
    },
    {
      name = 'WSL:Ubuntu22',
      distribution = 'Ubuntu-22.04',
      username = 'karleeov', -- Replace with your WSL2 Ubuntu username
      default_cwd = '/home/karleeov', -- Replace with the correct home directory
      default_prog = { 'bash', '-l' }, -- Adjust the shell if necessary
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


  font = wezterm.font("FiraCode Nerd Font Mono"),
  font_size = 12,
  color_scheme = 'Builtin Solarized Dark',
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
          args = {'wsl', '--distribution', 'Ubuntu-22.04'}
        }, pane)
      end), mods = 'CTRL|SHIFT', key = 'W' },
    { action = wezterm.action_callback(function(window, pane)
        window:perform_action(wezterm.action.SpawnCommandInNewTab {
          args = {'wsl', '--distribution', 'Arch'}
        }, pane)
      end), mods = 'CTRL|SHIFT', key = 'Q' },
    { action = wezterm.action_callback(function(window, pane)
        window:perform_action(wezterm.action.SpawnCommandInNewTab {
          args = {'pwsh-preview'}
        }, pane)
      end), mods = 'CTRL|SHIFT', key = 'P' },
  },
}