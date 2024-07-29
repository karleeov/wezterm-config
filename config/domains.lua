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
      name = 'WSL:Ubuntu24',
      distribution = 'Ubuntu-24.04',
      username = 'karleeov', -- Replace with your WSL2 Ubuntu username
      default_cwd = '/home/karleeov', -- Replace with the correct home directory
      default_prog = { 'bash', '-l' }, -- Adjust the shell if necessary
    },
  },

  -- Default to Arch WSL distribution
  default_prog = { 'wsl.exe', '--distribution', 'Arch', '--cd', '~' },

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
          args = {'wsl', '--distribution', 'Ubuntu-24.04'}
        }, pane)
      end), mods = 'CTRL|SHIFT', key = 'U' },
    { action = wezterm.action_callback(function(window, pane)
        window:perform_action(wezterm.action.SpawnCommandInNewTab {
          args = {'wsl', '--distribution', 'Arch'}
        }, pane)
      end), mods = 'CTRL|SHIFT', key = 'A' },
    { action = wezterm.action_callback(function(window, pane)
        window:perform_action(wezterm.action.SpawnCommandInNewTab {
          args = {'pwsh-preview'}
        }, pane)
      end), mods = 'CTRL|SHIFT', key = 'P' },
  },
}