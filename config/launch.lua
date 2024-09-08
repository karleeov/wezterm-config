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
         args = { 'C:\\Users\\kevin\\scoop\\apps\\git\\current\\bin\\bash.exe' },
      },
   }
   
   -- Configure the WSL domain for Arch
   options.wsl_domains = {
      {
         name = 'Arch',
         distribution = 'Arch',
         username = 'karleeov',  -- Replace with your actual username
         default_cwd = '/mnt/c/Users/li_sz',  -- Set the default directory for Arch
         default_prog = { 'fish', '-l' },  -- Default shell for Arch
      },
   }
elseif platform.is_mac then
   options.default_prog = { '/opt/homebrew/bin/fish', '-l' }  -- Default to Fish shell on macOS
   options.launch_menu = {
      { label = 'Bash', args = { 'bash', '-l' } },
      { label = 'Fish', args = { '/opt/homebrew/bin/fish', '-l' } },
      { label = 'Nushell', args = { 'nu', '-l' } },
      { label = 'Zsh', args = { 'zsh', '-l' } },
   }
elseif platform.is_linux then
   options.default_prog = { 'fish', '-l' }  -- Default to Fish shell on Linux
   options.launch_menu = {
      { label = 'Bash', args = { 'bash', '-l' } },
      { label = 'Fish', args = { 'fish', '-l' } },
      { label = 'Zsh', args = { 'zsh', '-l' } },
   }
end

return options