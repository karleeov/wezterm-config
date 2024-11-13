local wezterm = require('wezterm')

return {
  animation_fps = 60,
  max_fps = 60,
  front_end = 'WebGpu',
  webgpu_power_preference = 'HighPerformance',

  -- Apply the cyberpunk color scheme
  colors = {
    foreground = '#00ff9f',  -- Neon green
    background = '#0d0d1f',  -- Dark blue-black

    cursor_bg = '#ff00ff',  -- Neon pink
    cursor_fg = '#000000',
    cursor_border = '#ff00ff',

    selection_fg = '#000000',
    selection_bg = '#00ffff',  -- Neon cyan

    scrollbar_thumb = '#222222',

    split = '#444444',

    ansi = {
      '#000000',  -- black
      '#ff0055',  -- red
      '#00ff9f',  -- green
      '#ff00ff',  -- magenta
      '#00b8ff',  -- blue
      '#bd00ff',  -- purple
      '#00ffff',  -- cyan
      '#ffffff',  -- white
    },
    brights = {
      '#001eff',  -- bright black
      '#ff1177',  -- bright red
      '#00ffaa',  -- bright green
      '#ff00ff',  -- bright magenta
      '#00ffff',  -- bright blue
      '#d600ff',  -- bright purple
      '#00ffff',  -- bright cyan
      '#ffffff',  -- bright white
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
      background = '#0d0d1f',

      active_tab = {
        bg_color = '#00ff9f',
        fg_color = '#0d0d1f',
        intensity = 'Bold',
        underline = 'None',
        italic = false,
        strikethrough = false,
      },

      inactive_tab = {
        bg_color = '#0d0d1f',
        fg_color = '#00b8ff',
      },

      inactive_tab_hover = {
        bg_color = '#002244',
        fg_color = '#00ffff',
        italic = true,
      },

      new_tab = {
        bg_color = '#0d0d1f',
        fg_color = '#ff00ff',
      },

      new_tab_hover = {
        bg_color = '#002244',
        fg_color = '#00ffff',
        italic = true,
      },
    },
  },

  -- Background settings
  background = {
    {
      source = { Color = '#000000' },
      height = '100%',
      width = '100%',
      opacity = 0.7,
    },
  },

  -- Scrollbar settings
  enable_scroll_bar = false,  -- Keep off for better performance

  -- Tab bar settings
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = false,
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
}