local wezterm = require('wezterm')
local config = wezterm.config_builder()

-- Enable configuration reloading
wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = wezterm.mux.spawn_window({
    args = { 'wsl', '--distribution', 'Arch' }
  })
  window:gui_window():maximize()
end)

-- Load your config files
local config_files = {
  'config/domains',
  'config/appearance',
  'colors/custom',
}

-- Merge all configurations
for _, file in ipairs(config_files) do
  local ok, module = pcall(require, file)
  if ok then
    for k, v in pairs(module) do
      if k == 'colors' then
        -- Special handling for colors to ensure proper merging
        config.colors = v
      else
        config[k] = v
      end
    end
  else
    wezterm.log_error('Failed to load ' .. file .. ': ' .. tostring(module))
  end
end

return config
