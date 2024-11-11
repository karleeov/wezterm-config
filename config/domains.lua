local wezterm = require('wezterm')
local config = wezterm.config_builder()
local colors = require('colors.custom')

-- Add status bar formatting function
wezterm.on('update-status', function(window, pane)
  -- Get current date/time
  local date = wezterm.strftime('%Y-%m-%d %H:%M:%S')
  
  -- Get active workspace
  local stat = window:active_workspace()
  
  -- Get current working directory
  local cwd = pane:get_current_working_dir()
  local home = os.getenv('HOME')
  if cwd then
    cwd = cwd.file_path
    if home then
      cwd = cwd:gsub('^' .. home, '~')
    end
  end

  -- Get CPU and Memory usage
  local success, stdout, stderr = wezterm.run_child_process({ 'wsl', 'top', '-bn1' })
  local cpu = '??%'
  local mem = '??%'
  if success then
    -- Parse top output for CPU and memory info
    cpu = stdout:match('%%Cpu%(s%):(%s+%d+.%d+)')
    mem = stdout:match('MiB Mem :%s+%d+.%d+ total,%s+(%d+.%d+) free')
  end

  -- Set the status bar text
  window:set_right_status(wezterm.format({
    { Foreground = { Color = '#89b4fa' } },
    { Text = ' CPU: ' .. cpu .. ' | ' },
    { Foreground = { Color = '#a6e3a1' } },
    { Text = 'MEM: ' .. mem .. ' | ' },
    { Foreground = { Color = '#f5c2e7' } },
    { Text = cwd .. ' | ' },
    { Foreground = { Color = '#cba6f7' } },
    { Text = stat .. ' | ' },
    { Foreground = { Color = '#f5e0dc' } },
    { Text = date .. ' ' },
  }))
end)

config.default_domain = 'WSL:Arch'

config.wsl_domains = {
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
}

config.animation_fps = 60
config.max_fps = 60
config.front_end = 'WebGpu'
config.webgpu_power_preference = 'HighPerformance'

config.background = {
  {
    source = { File = wezterm.GLOBAL.background },
    horizontal_align = 'Center',
  },
  {
    source = { Color = '#000000' },
    height = '100%',
    width = '100%',
    opacity = 0.7,
  },
}

config.enable_scroll_bar = false

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_max_width = 25
config.show_tab_index_in_tab_bar = false
config.switch_to_last_active_tab_when_closing_tab = true

config.window_padding = {
  left = 5,
  right = 10,
  top = 12,
  bottom = 7,
}
config.window_close_confirmation = 'NeverPrompt'
config.window_frame = {
  active_titlebar_bg = '#090909',
  font = wezterm.font({ family = "JetBrainsMono Nerd Font", weight = "Bold" }),
  font_size = 10,
}
config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.85,
}

config.keys = {
  { action = wezterm.action_callback(function(window, pane)
      window:perform_action(wezterm.action.SpawnCommandInNewTab {
        args = {'wsl', '--distribution', 'Arch'}
      }, pane)
    end), mods = 'CTRL|SHIFT', key = 'A' },

  { action = wezterm.action_callback(function(window, pane)
      window:perform_action(wezterm.action.SpawnCommandInNewTab {
        args = {'wsl', '--distribution', 'Ubuntu-22.04'}
      }, pane)
    end), mods = 'CTRL|SHIFT', key = 'W' },

  -- PowerShell Preview shortcut
  { action = wezterm.action_callback(function(window, pane)
      window:perform_action(wezterm.action.SpawnCommandInNewTab {
        args = {'C:\\Program Files\\PowerShell\\7-preview\\pwsh.exe'},  -- Use full path if needed
      }, pane)
    end), mods = 'CTRL|SHIFT', key = 'B' },
}

config.status_update_interval = 1000

return config