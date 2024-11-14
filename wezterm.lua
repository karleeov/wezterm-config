local wezterm = require('wezterm')

-- Define a color palette for easy management
local colors = {
  neon_green = '#00ff9f',
  neon_pink = '#ff00ff',
  neon_blue = '#00b8ff',
  neon_cyan = '#00ffff',
  dark_background = '#0d0d1f',
  bright_white = '#ffffff',
  dark_grey = '#313244',
}

-- Event handler to update the right status
wezterm.on('update-right-status', function(window, pane)
  window:set_right_status(wezterm.format({
    { Foreground = { Color = colors.neon_green } },
    { Text = "WezTerm | " },
    { Foreground = { Color = colors.neon_pink } },
    { Text = wezterm.strftime("%Y-%m-%d %H:%M:%S") },
  }))
end)

return {
  -- Performance settings
  animation_fps = 60,
  max_fps = 60,
  front_end = 'WebGpu',
  webgpu_power_preference = 'HighPerformance',

  -- Appearance settings
  colors = {
    foreground = colors.neon_green,
    background = colors.dark_background,
    cursor_bg = colors.neon_pink,
    cursor_fg = '#000000',
    cursor_border = colors.neon_pink,
    selection_fg = '#000000',
    selection_bg = colors.neon_cyan,
    scrollbar_thumb = '#222222',
    split = '#444444',

    ansi = {
      '#000000',  -- black
      '#ff0055',  -- red
      colors.neon_green,  -- green
      colors.neon_pink,  -- magenta
      colors.neon_blue,  -- blue
      '#bd00ff',  -- purple
      colors.neon_cyan,  -- cyan
      colors.bright_white,  -- white
    },
    brights = {
      '#001eff',  -- bright black
      '#ff1177',  -- bright red
      '#00ffaa',  -- bright green
      colors.neon_pink,  -- bright magenta
      colors.neon_cyan,  -- bright blue
      '#d600ff',  -- bright purple
      colors.neon_cyan,  -- bright cyan
      colors.bright_white,  -- bright white
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

    -- Tab bar settings
    tab_bar = {
      background = colors.dark_background,

      active_tab = {
        bg_color = colors.neon_green,
        fg_color = colors.dark_background,
        intensity = 'Bold',
        underline = 'None',
        italic = false,
        strikethrough = false,
      },

      inactive_tab = {
        bg_color = colors.dark_background,
        fg_color = colors.neon_blue,
      },

      inactive_tab_hover = {
        bg_color = '#002244',
        fg_color = colors.neon_cyan,
        italic = true,
      },

      new_tab = {
        bg_color = colors.dark_background,
        fg_color = colors.neon_pink,
      },

      new_tab_hover = {
        bg_color = '#002244',
        fg_color = colors.neon_cyan,
        italic = true,
      },
    },
  },

  -- Background settings
  background = {
    {
      source = { Color = colors.dark_background },
      height = '100%',
      width = '100%',
      opacity = 0.95,
    },
  },

  -- Scrollbar settings
  enable_scroll_bar = false,  -- Keep off for better performance

  -- Tab bar settings
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = false,
  use_fancy_tab_bar = true,
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
    active_titlebar_bg = '#0d0d1f',
    inactive_titlebar_bg = '#0a0a12',
    font = wezterm.font({ family = "JetBrainsMono Nerd Font", weight = "Bold" }),
    font_size = 10,
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
    { action = wezterm.action.ReloadConfiguration, mods = 'CTRL|SHIFT', key = 'R' },
    { action = wezterm.action.SpawnCommandInNewTab { args = { 'pwsh-preview' } }, mods = 'CTRL|SHIFT', key = 'P' },
  },

  -- Add these new settings
  window_background_opacity = 0.95,
  text_background_opacity = 0.9,
  
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
  hide_tab_bar_if_only_one_tab = false,

  -- Set Arch WSL as the default program
  default_prog = { 'wsl', '--distribution', 'Arch', '--exec', '/bin/zsh' },  -- Adjust the shell if needed
} 