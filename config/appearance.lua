local wezterm = require('wezterm')
local colors = require('colors.custom')

-- Remove this line as we'll be using the new color scheme
-- local neon_blue = '#00FFFF'

return {
  animation_fps = 60,
  max_fps = 60,
  front_end = 'WebGpu',
  webgpu_power_preference = 'HighPerformance',

  -- Remove the color_scheme line as we're defining our own colors
  -- color_scheme = 'Cyberpunk',
  
  -- Apply the new color scheme
  colors = {
    -- The default text color
    foreground = 'silver',
    -- The default background color
    background = 'black',

    cursor_bg = '#52ad70',
    cursor_fg = 'black',
    cursor_border = '#52ad70',

    selection_fg = 'black',
    selection_bg = '#fffacd',

    scrollbar_thumb = '#222222',

    split = '#444444',

    ansi = {
      'black',
      'maroon',
      'green',
      'olive',
      'navy',
      'purple',
      'teal',
      'silver',
    },
    brights = {
      'grey',
      'red',
      'lime',
      'yellow',
      'blue',
      'fuchsia',
      'aqua',
      'white',
    },

    indexed = { [136] = '#af8700' },

    compose_cursor = 'orange',

    copy_mode_active_highlight_bg = { Color = '#000000' },
    copy_mode_active_highlight_fg = { AnsiColor = 'Black' },
    copy_mode_inactive_highlight_bg = { Color = '#52ad70' },
    copy_mode_inactive_highlight_fg = { AnsiColor = 'White' },

    quick_select_label_bg = { Color = 'peru' },
    quick_select_label_fg = { Color = '#ffffff' },
    quick_select_match_bg = { AnsiColor = 'Navy' },
    quick_select_match_fg = { Color = '#ffffff' },

    -- Add the new tab bar color settings
    tab_bar = {
      background = '#0b0022',

      active_tab = {
        bg_color = '#2b2042',
        fg_color = '#c0c0c0',
        intensity = 'Normal',
        underline = 'None',
        italic = false,
        strikethrough = false,
      },

      inactive_tab = {
        bg_color = '#1b1032',
        fg_color = '#808080',
      },

      inactive_tab_hover = {
        bg_color = '#3b3052',
        fg_color = '#909090',
        italic = true,
      },

      new_tab = {
        bg_color = '#1b1032',
        fg_color = '#808080',
      },

      new_tab_hover = {
        bg_color = '#3b3052',
        fg_color = '#909090',
        italic = true,
      },
    },
  },

  -- Background settings
  background = {
    {
      source = { File = wezterm.home_dir .. "/path/to/cyberpunk-bg.jpg" },
      opacity = 0.15,
      hsb = { brightness = 0.3 },
    },
    {
      source = { Color = '#000000' },  -- Consistent with the new background color
      height = '100%',
      width = '100%',
      opacity = 0.9,
    },
  },

  -- Scrollbar settings
  enable_scroll_bar = false,  -- Keep off for better performance

  -- Tab bar settings
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  tab_max_width = 25,
  show_tab_index_in_tab_bar = false,
  switch_to_last_active_tab_when_closing_tab = true,

  -- Window settings
  window_padding = {
    left = 5,
    right = 10,
    top = 12,
    bottom = 7,
  },
  window_close_confirmation = 'NeverPrompt',
  window_frame = {
    active_titlebar_bg = '#090909',  -- Dark title bar for a sleek look
  },
  inactive_pane_hsb = {
    saturation = 0.8,
    brightness = 0.7,
  },

  -- Key bindings
  keys = {
    { action = wezterm.action.CopyTo 'Clipboard', mods = 'CTRL', key = 'C' },
    { action = wezterm.action.PasteFrom 'Clipboard', mods = 'CTRL', key = 'V' },
    { action = wezterm.action.DecreaseFontSize, mods = 'CTRL', key = '-' },
    { action = wezterm.action.IncreaseFontSize, mods = 'CTRL', key = '=' },
    { action = wezterm.action.ResetFontSize, mods = 'CTRL', key = '0' },
    { action = wezterm.action.ToggleFullScreen, key = 'F11' },

    -- Duplicating Arch terminal in a new tab
    { action = wezterm.action_callback(function(window, pane)
        window:perform_action(wezterm.action.SpawnCommandInNewTab {
          args = {'wsl', '--distribution', 'Arch'}
        }, pane)
      end), mods = 'CTRL|SHIFT', key = 'A' },

    -- Split pane commands
    { action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }, mods = 'CTRL|SHIFT', key = '-' },
    { action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }, mods = 'CTRL|SHIFT', key = '|' },

    -- Commands to open other distributions
    { action = wezterm.action_callback(function(window, pane)
        window:perform_action(wezterm.action.SpawnCommandInNewTab {
          args = {'wsl', '--distribution', 'Ubuntu-24.04'}
        }, pane)
      end), mods = 'CTRL|SHIFT', key = 'O' },
    
    { action = wezterm.action_callback(function(window, pane)
        window:perform_action(wezterm.action.SpawnCommandInNewTab {
          args = {'wsl', '--distribution', 'Arch'}
        }, pane)
      end), mods = 'CTRL|SHIFT', key = 'D' },

    { action = wezterm.action_callback(function(window, pane)
        window:perform_action(wezterm.action.SpawnCommandInNewTab {
          args = {'pwsh-preview'}
        }, pane)
      end), mods = 'CTRL|SHIFT', key = 'P' },
  },

  -- Add these new settings
  window_background_opacity = 0.95,
  text_background_opacity = 0.95,
  
  -- Add window decorations
  window_decorations = "RESIZE",
  
  -- Add a cool font (install this font first)
  font = wezterm.font_with_fallback({
    { family = "JetBrainsMono Nerd Font", weight = "Medium" },
    { family = "Fira Code", weight = "Medium" },
  }),
  font_size = 11,
  
  -- Add some cool effects
  window_frame = {
    active_titlebar_bg = '#0a0a12',
    inactive_titlebar_bg = '#0a0a12',
    font = wezterm.font({ family = "JetBrainsMono Nerd Font", weight = "Bold" }),
    font_size = 10,
  },
  
  -- Add a cool cursor style
  default_cursor_style = 'BlinkingBlock',
  cursor_blink_rate = 500,
  
  -- Add visual bell effect
  visual_bell = {
    fade_in_duration_ms = 75,
    fade_out_duration_ms = 75,
    target = 'CursorColor',
  },

  -- Add this to create a startup animation effect
  window_padding = {
    left = "1cell",
    right = "1cell",
    top = "0.5cell",
    bottom = "0.5cell",
  },

  initial_rows = 24,
  initial_cols = 80,

  -- Replace the tab_bar_style block with this simpler version:
  tab_bar_style = {
    new_tab = wezterm.format({
      { Text = " + " },
    }),
  },

  -- Move these settings outside of tab_bar_style as they are top-level config options
  tab_max_width = 25,
  show_tab_index_in_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
}