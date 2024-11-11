-- A slightly altered version of catppucchin mocha
local cyberpunk = {
   neon_green = '#00ff9f',
   neon_pink = '#ff00ff',
   neon_blue = '#00b8ff',
   neon_cyan = '#00ffff',
   dark_background = '#0d0d1f',
   bright_white = '#ffffff',
   dark_grey = '#313244',
}

-- Wrap everything in a colors table
return {
   colors = {
      foreground = cyberpunk.neon_green,
      background = cyberpunk.dark_background,
      cursor_bg = cyberpunk.neon_pink,
      cursor_border = cyberpunk.neon_pink,
      cursor_fg = cyberpunk.dark_background,
      
      -- Make sure these are the only selection-related fields
      selection_bg = cyberpunk.neon_cyan,
      selection_fg = cyberpunk.dark_background,
      
      ansi = {
         '#000000', -- black
         '#ff0055', -- red
         cyberpunk.neon_green, -- green
         '#ff00ff', -- yellow (using pink)
         cyberpunk.neon_blue, -- blue
         '#bd00ff', -- magenta
         cyberpunk.neon_cyan, -- cyan
         cyberpunk.bright_white, -- white
      },
      brights = {
         '#001eff', -- bright black (dark blue)
         '#ff1177', -- bright red
         '#00ffaa', -- bright green
         '#ff00ff', -- bright yellow (pink)
         cyberpunk.neon_cyan, -- bright blue
         '#d600ff', -- bright magenta
         cyberpunk.neon_cyan, -- bright cyan
         cyberpunk.bright_white, -- bright white
      },
      
      tab_bar = {
         background = cyberpunk.dark_background,
         active_tab = {
            bg_color = cyberpunk.neon_green,
            fg_color = cyberpunk.dark_background,
         },
         inactive_tab = {
            bg_color = cyberpunk.dark_grey,
            fg_color = cyberpunk.neon_blue,
         },
         inactive_tab_hover = {
            bg_color = '#002244',
            fg_color = cyberpunk.neon_cyan,
         },
         new_tab = {
            bg_color = cyberpunk.dark_background,
            fg_color = cyberpunk.neon_pink,
         },
         new_tab_hover = {
            bg_color = '#002244',
            fg_color = cyberpunk.neon_cyan,
         },
      },
      
      visual_bell = cyberpunk.dark_grey,
      indexed = {
         [16] = '#ff8800', -- orange
         [17] = cyberpunk.neon_pink,
      },
      scrollbar_thumb = cyberpunk.dark_grey,
      split = '#444444',
   }
}
