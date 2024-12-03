local wezterm = require('wezterm')

-- Define custom symbols for a more cyberpunk look
local SYMBOLS = {
    TERMINAL = '󰆍',
    RAM = '󰍛',
    CPU = '󰘚',
    CLOCK = '󱑎',
    FOLDER = '󰉋',
    NET = '󰛳',
    BATTERY_HIGH = '󱈏',
    BATTERY_MED = '󱊣',
    BATTERY_LOW = '󱊡',
    GRID = '󰹕',
    LOCK = '󰌾',
    POWER = '󰐥',
    SEPARATOR = '󰘧',
    DOT = '󰇘',
    SPLIT_HORIZONTAL = '󰯍',
    SPLIT_VERTICAL = '󰯎',
    CIRCUIT = '󰘚',
    DATA = '󰋊',
}

-- Define a cyberpunk color palette
local colors = {
    -- Core neon colors
    neon_pink = '#FF10F0',
    neon_blue = '#00FFF9',
    neon_purple = '#BD00FF',
    neon_green = '#39FF14',
    neon_yellow = '#FFFF00',
    neon_orange = '#FF6C11',
    neon_cyan = '#00FFFF',
    neon_magenta = '#FF1B8D',
    neon_red = '#FF003C',
    neon_lime = '#CCFF00',
    
    -- Background shades
    dark_bg = '#0a0817',
    darker_bg = '#060614',
    cyber_black = '#000507',
    cyber_void = '#0D0221',
    
    -- Accent colors
    text_color = '#00FFFF',
    cyber_purple = '#9D00FF',
    cyber_red = '#FF003C',
    cyber_orange = '#FF5D00',
    cyber_teal = '#00FFC8',
    grid_blue = '#00A9FF',
    highlight_pink = '#FF71CE',
    soft_purple = '#B967FF',
    dark_purple = '#1A1A2E',
    matrix_green = '#00FF41',
    neon_blood = '#FF073A',
    
    -- Additional cyberpunk colors
    cyber_azure = '#007FFF',
    cyber_electric = '#0FF0FC',
    cyber_hot_pink = '#FF69B4',
    cyber_plasma = '#FF10F0',
    cyber_pulse = '#FF003F',
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
config.enable_scroll_bar = true
config.scrollback_lines = 10000
config.enable_kitty_keyboard = true
config.enable_csi_u_key_encoding = true
config.term = 'wezterm'

-- Font configuration
config.font = wezterm.font_with_fallback({
    { family = "JetBrainsMono Nerd Font", weight = "Medium", harfbuzz_features = {"calt=1", "clig=1", "liga=1"} },
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
    left = 15,
    right = 15,
    top = 12,
    bottom = 12,
}
config.window_background_opacity = 0.92
config.text_background_opacity = 0.95
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.integrated_title_button_style = "Windows"
config.integrated_title_button_color = "auto"
config.window_close_confirmation = 'NeverPrompt'
config.window_frame = {
    font = wezterm.font { family = 'JetBrainsMono Nerd Font', weight = 'Bold' },
    font_size = 11.0,
    active_titlebar_bg = colors.cyber_void,
    inactive_titlebar_bg = colors.cyber_black,
    active_titlebar_fg = colors.neon_cyan,
    inactive_titlebar_fg = colors.grid_blue,
    active_titlebar_border_bottom = colors.neon_pink,
    button_fg = colors.neon_cyan,
    button_bg = colors.cyber_void,
    button_hover_fg = colors.neon_pink,
    button_hover_bg = colors.dark_purple,
}

-- Cursor settings
config.default_cursor_style = 'SteadyBar'
config.cursor_blink_rate = 500
config.cursor_blink_ease_in = 'Linear'
config.cursor_blink_ease_out = 'Linear'
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
        { Background = { Color = colors.dark_purple }},
        { Foreground = { Color = colors.cyber_electric }},
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
    selection_bg = colors.cyber_electric,
    
    ansi = {
        colors.cyber_black,
        colors.cyber_pulse,
        colors.matrix_green,
        colors.neon_yellow,
        colors.cyber_azure,
        colors.neon_magenta,
        colors.cyber_electric,
        '#FFFFFF',
    },
    
    brights = {
        colors.dark_purple,
        colors.neon_blood,
        colors.neon_lime,
        colors.neon_yellow,
        colors.grid_blue,
        colors.cyber_hot_pink,
        colors.cyber_teal,
        colors.neon_cyan,
    },
    
    tab_bar = {
        background = colors.cyber_void,
        active_tab = {
            bg_color = colors.dark_purple,
            fg_color = colors.neon_cyan,
            intensity = 'Bold',
            underline = 'Single',
            italic = false,
        },
        inactive_tab = {
            bg_color = colors.cyber_black,
            fg_color = colors.grid_blue,
            intensity = 'Half',
        },
        inactive_tab_hover = {
            bg_color = colors.cyber_void,
            fg_color = colors.cyber_electric,
            italic = true,
        },
        new_tab = {
            bg_color = colors.cyber_void,
            fg_color = colors.neon_blue,
        },
        new_tab_hover = {
            bg_color = colors.dark_purple,
            fg_color = colors.cyber_electric,
            italic = true,
        },
    },
    
    visual_bell = colors.cyber_pulse,
    
    -- Split colors
    split = colors.neon_magenta,
    
    -- Indexed colors for more variety
    indexed = {
        [16] = colors.cyber_orange,
        [17] = colors.cyber_plasma,
        [18] = colors.cyber_electric,
        [19] = colors.neon_blood,
        [20] = colors.cyber_hot_pink,
        [21] = colors.cyber_pulse,
    },
}

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

    -- Launch PowerShell Preview
    { action = wezterm.action.SpawnCommandInNewTab { args = { 'pwsh-preview' } }, mods = 'CTRL|SHIFT', key = 'P' },
}

-- Default shell configuration
local function get_shell()
    -- Check if WSL and Arch are available
    local success, _ = wezterm.run_child_process({"wsl.exe", "--distribution", "Arch", "which", "zsh"})
    if success then
        return { 'wsl.exe', '--distribution', 'Arch', '--exec', '/bin/zsh' }
    end
    
    -- Fall back to PowerShell 7 if available
    local pwsh_path = 'C:/Program Files/PowerShell/7/pwsh.exe'
    success, _ = wezterm.run_child_process({"cmd.exe", "/c", "where", pwsh_path})
    if success then
        return { pwsh_path }
    end
    
    -- Ultimate fallback to Windows PowerShell
    return { 'C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe' }
end

config.default_prog = get_shell()
config.default_cwd = wezterm.home_dir

return config