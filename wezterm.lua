local wezterm = require('wezterm')

-- Define custom symbols for a more cyberpunk look
local SYMBOLS = {
    TERMINAL = '󰆍',
    RAM = '󰍛',
    CPU = '󰘚',
    CLOCK = '󱑎',
    FOLDER = '󰉋',
    NET = '󰛳',
    BATTERY_HIGH = '󰁹',
    BATTERY_MED = '󰁾',
    BATTERY_LOW = '󰂃',
    GRID = '󰹉',
    LOCK = '󰌾',
    POWER = '󰐥',
    SEPARATOR = '󰇙',
    DOT = '󰧞',
}

-- Define a cyberpunk color palette
local colors = {
    neon_pink = '#FF2A6D',
    neon_blue = '#05D9E8',
    neon_purple = '#B000FF',
    neon_green = '#39FF14',
    neon_yellow = '#FFD300',
    neon_orange = '#FF6C11',
    neon_cyan = '#01FFF4',
    neon_magenta = '#FF1B8D',
    neon_red = '#FF003C',
    neon_lime = '#CCFF00',
    dark_bg = '#0a0b16',
    darker_bg = '#070811',
    cyber_black = '#000507',
    text_color = '#01FFF4',
    cyber_purple = '#9D00FF',
    cyber_red = '#FF003C',
    cyber_orange = '#FF5D00',
    cyber_teal = '#00FFC8',
    grid_blue = '#00A9FF',
    highlight_pink = '#FF71CE',
    soft_purple = '#B967FF',
    dark_purple = '#1A1A2E',
    matrix_green = '#00FF41',
    cyber_void = '#0D0221',
    neon_blood = '#FF073A',
}

local config = {}

-- Custom function to get battery info
local function get_battery_info()
    local success, battery = pcall(wezterm.battery_info)
    if success and battery then
        local state = battery[1]
        local icon = SYMBOLS.BATTERY_HIGH
        if state.state_of_charge < 0.3 then
            icon = SYMBOLS.BATTERY_LOW
        elseif state.state_of_charge < 0.7 then
            icon = SYMBOLS.BATTERY_MED
        end
        return string.format('%s %.0f%% ', icon, state.state_of_charge * 100)
    end
    return ''
end

-- Event handler for status bar
wezterm.on('update-right-status', function(window, pane)
    local date = wezterm.strftime('%H:%M')
    local battery = get_battery_info()
    
    window:set_right_status(wezterm.format({
        { Background = { Color = colors.cyber_void }},
        { Foreground = { Color = colors.grid_blue }},
        { Text = ' ' .. SYMBOLS.GRID .. ' ' },
        { Foreground = { Color = colors.neon_magenta }},
        { Text = battery },
        { Foreground = { Color = colors.neon_cyan }},
        { Text = SYMBOLS.SEPARATOR },
        { Foreground = { Color = colors.highlight_pink }},
        { Text = ' ' .. SYMBOLS.CLOCK .. ' ' .. date .. ' ' },
        { Foreground = { Color = colors.matrix_green }},
        { Text = SYMBOLS.TERMINAL },
        { Text = ' ' },
    }))
end)

-- Performance settings
config.animation_fps = 60
config.max_fps = 120
config.front_end = 'WebGpu'
config.webgpu_power_preference = 'HighPerformance'
config.enable_wayland = true
config.enable_scroll_bar = true
config.scrollback_lines = 10000
config.enable_kitty_keyboard = true
config.enable_csi_u_key_encoding = true
config.term = 'wezterm'

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
config.window_background_opacity = 0.95
config.text_background_opacity = 1.0
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.integrated_title_button_style = "Windows"
config.integrated_title_button_color = "auto"
config.window_close_confirmation = 'NeverPrompt'
config.window_frame = {
    font = wezterm.font { family = 'JetBrainsMono Nerd Font', weight = 'Bold' },
    font_size = 11.0,
    active_titlebar_bg = colors.cyber_void,
    inactive_titlebar_bg = colors.cyber_black,
}

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
config.tab_bar_at_bottom = true
config.show_new_tab_button_in_tab_bar = true

-- Tab bar style
config.tab_bar_style = {
    new_tab = wezterm.format({
        { Background = { Color = colors.cyber_void }},
        { Foreground = { Color = colors.neon_blue }},
        { Text = ' ' .. SYMBOLS.POWER .. ' ' },
    }),
    new_tab_hover = wezterm.format({
        { Background = { Color = colors.soft_purple }},
        { Foreground = { Color = colors.neon_cyan }},
        { Text = ' ' .. SYMBOLS.POWER .. ' ' },
    }),
}

-- Colors configuration
config.colors = {
    foreground = colors.text_color,
    background = colors.dark_bg,
    cursor_bg = colors.neon_magenta,
    cursor_fg = colors.cyber_black,
    cursor_border = colors.neon_blue,
    selection_fg = colors.cyber_black,
    selection_bg = colors.neon_cyan,
    
    ansi = {
        colors.cyber_black,
        colors.neon_blood,
        colors.matrix_green,
        colors.neon_yellow,
        colors.grid_blue,
        colors.neon_magenta,
        colors.neon_cyan,
        '#FFFFFF',
    },
    
    brights = {
        colors.dark_purple,
        colors.cyber_red,
        colors.neon_lime,
        colors.neon_yellow,
        colors.grid_blue,
        colors.highlight_pink,
        colors.cyber_teal,
        '#FFFFFF',
    },
    
    tab_bar = {
        background = colors.cyber_void,
        active_tab = {
            bg_color = colors.dark_purple,
            fg_color = colors.neon_cyan,
            intensity = 'Bold',
            underline = 'None',
            italic = false,
        },
        inactive_tab = {
            bg_color = colors.cyber_black,
            fg_color = colors.grid_blue,
            intensity = 'Half',
        },
        inactive_tab_hover = {
            bg_color = colors.soft_purple,
            fg_color = colors.neon_cyan,
            italic = true,
        },
        new_tab = {
            bg_color = colors.cyber_void,
            fg_color = colors.neon_blue,
        },
        new_tab_hover = {
            bg_color = colors.soft_purple,
            fg_color = colors.neon_cyan,
            italic = true,
        },
    },
}

-- Default shell configuration
local powershell_dir = 'C:/Program Files/PowerShell/7-preview/pwsh.exe' -- PowerShell 7.5.0 path
local fallback_paths = {
    'C:/Program Files/PowerShell/7/pwsh.exe',
    'C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe'
}

local function get_powershell()
    -- First try PowerShell 7.5.0
    local success, _ = pcall(wezterm.run_child_process, {powershell_dir, "-c", "exit"})
    if success then
        return powershell_dir
    end
    
    -- Try fallback paths
    for _, path in ipairs(fallback_paths) do
        success, _ = pcall(wezterm.run_child_process, {path, "-c", "exit"})
        if success then
            return path
        end
    end
    
    -- If nothing else works, return the default PowerShell
    return fallback_paths[2]
end

-- Store the shell configurations
local shell_configs = {
    wsl = { 'wsl.exe', '--distribution', 'Arch', '--exec', '/bin/zsh' },
    powershell = { get_powershell() }
}

config.default_prog = shell_configs.wsl
config.default_cwd = wezterm.home_dir

-- Key bindings
config.keys = {
    -- Copy/Paste with Ctrl+C/Ctrl+V
    {
        key = 'c',
        mods = 'CTRL',
        action = wezterm.action_callback(function(window, pane)
            local has_selection = window:get_selection_text_for_pane(pane) ~= ''
            if has_selection then
                window:perform_action(wezterm.action.CopyTo 'Clipboard', pane)
            else
                window:perform_action(wezterm.action.SendKey{ key='c', mods='CTRL' }, pane)
            end
        end),
    },
    { 
        key = 'v',
        mods = 'CTRL',
        action = wezterm.action.PasteFrom 'Clipboard'
    },

    -- Font size
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

    -- Shell switching
    {
        key = 'p',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.SpawnCommandInNewTab {
            args = shell_configs.powershell,
        },
    },
    {
        key = 'w',
        mods = 'CTRL|ALT',
        action = wezterm.action.SpawnCommandInNewTab {
            args = shell_configs.wsl,
        },
    },
}

return config