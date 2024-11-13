local wezterm = require('wezterm')
local platform = require('utils.platform')()

local options = {
   default_prog = {},
   launch_menu = {},
   wsl_domains = {},
}

-- Configure WSL domains
if platform.is_win then
   options.default_prog = { 'wsl', '--distribution', 'Arch' }  -- Set Arch as the default WSL distribution
   options.launch_menu = {
      { label = 'PowerShell Core', args = { 'pwsh' } },
      { label = 'PowerShell Desktop', args = { 'powershell' } },
      { label = 'Command Prompt', args = { 'cmd' } },
      { label = 'Nushell', args = { 'nu' } },
      {
         label = 'Git Bash',
         args = { 'C:\\Users\\li_sz\\scoop\\apps\\git\\current\\bin\\bash.exe' },
      },
      {
         label = "Matrix Effect",
         args = { "cmatrix", "-s", "-C", "cyan" },
      },
      {
         label = "System Monitor",
         args = { "htop" },
      },
      {
         label = 'Arch: System Update',
         args = { 'wsl', '-d', 'Arch', '--', 'yay', '-Syu' },
      },
      {
         label = 'Arch: System Monitor',
         args = { 'wsl', '-d', 'Arch', '--', 'btop' },
      },
      {
         label = 'Arch: File Manager',
         args = { 'wsl', '-d', 'Arch', '--', 'ranger' },
      },
      {
         label = 'Arch: Resource Monitor',
         args = { 'wsl', '-d', 'Arch', '--', 'htop' },
      },
      {
         label = 'Arch: Network Monitor',
         args = { 'wsl', '-d', 'Arch', '--', 'nethogs' },
      },
      {
         label = 'Matrix Effect (Cool)',
         args = { 'wsl', '-d', 'Arch', '--', 'unimatrix', '-s', '96', '-c', 'magenta' },
      },
   }
   
   -- Configure the WSL domain for Arch
   options.wsl_domains = {
      {
         name = 'Arch',
         distribution = 'Arch',
         username = 'karleeov',  -- Replace with your actual username
         default_cwd = '/mnt/c/Users/li_sz',  -- Set the default directory for Arch
         default_prog = { 'zsh', '-l' },  -- Default shell for Arch
      },
   }
elseif platform.is_mac then
   options.default_prog = { '/opt/homebrew/bin/fish', '-l' }  -- Default to Fish shell on macOS
   options.launch_menu = {
      { label = 'Bash', args = { 'bash', '-l' } },
      { label = 'Fish', args = { '/opt/homebrew/bin/fish', '-l' } },
      { label = 'Nushell', args = { 'nu', '-l' } },
      { label = 'Zsh', args = { 'zsh', '-l' } },
      {
         label = "Matrix Effect",
         args = { "cmatrix", "-s", "-C", "cyan" },
      },
      {
         label = "System Monitor",
         args = { "htop" },
      },
   }
elseif platform.is_linux then
   options.default_prog = { 'fish', '-l' }  -- Default to Fish shell on Linux
   options.launch_menu = {
      { label = 'Bash', args = { 'bash', '-l' } },
      { label = 'Fish', args = { 'fish', '-l' } },
      { label = 'Zsh', args = { 'zsh', '-l' } },
      {
         label = "Matrix Effect",
         args = { "cmatrix", "-s", "-C", "cyan" },
      },
      {
         label = "System Monitor",
         args = { "htop" },
      },
   }
end

-- Add session management
wezterm.on('gui-startup', function(cmd)
    -- Restore previous session if it exists
    local success, session = pcall(wezterm.mux.get_session, "last_session")
    if success and session then
        session:restore()
        return
    end

    -- Otherwise create a new default window
    local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
    
    -- Save welcome message and session info
    pane:send_text("echo '>> System initialized. Welcome to cyberpunk terminal.'\n")
    wezterm.mux.save_session("last_session")
end)

-- Save session on exit
wezterm.on('window-close', function()
    wezterm.mux.save_session("last_session")
end)

return options