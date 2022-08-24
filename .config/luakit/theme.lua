--------------------------
-- Default luakit theme --
--------------------------

local theme = {}

-- Default settings
theme.font = "20px Fantasque Sans Mono"
theme.fg   = "#eceff4"
theme.bg   = "#2e3440"

-- Genaral colours
theme.success_fg = "#a3be8c"
theme.loaded_fg  = "#5e81ac"
theme.error_fg = "#eceff4"
theme.error_bg = "#bf616a"

-- Warning colours
theme.warning_fg = "#bf616a"
theme.warning_bg = "#eceff4"

-- Notification colours
theme.notif_fg = "#4c566a"
theme.notif_bg = "#eceff4"

-- Menu colours
theme.menu_fg                   = "#2e3440"
theme.menu_bg                   = "#eceff4"
theme.menu_selected_fg          = "#2e3440"
theme.menu_selected_bg          = "#ebcb8b"
theme.menu_title_bg             = "#eceff4"
theme.menu_primary_title_fg     = "#bf616a"
theme.menu_secondary_title_fg   = "#d08770"

theme.menu_disabled_fg = "#999"
theme.menu_disabled_bg = theme.menu_bg
theme.menu_enabled_fg = theme.menu_fg
theme.menu_enabled_bg = theme.menu_bg
theme.menu_active_fg = "#a3be8c"
theme.menu_active_bg = theme.menu_bg

-- Proxy manager
theme.proxy_active_menu_fg      = '#2e3440'
theme.proxy_active_menu_bg      = '#eceff4'
theme.proxy_inactive_menu_fg    = '#3b4252'
theme.proxy_inactive_menu_bg    = '#eceff4'

-- Statusbar specific
theme.sbar_fg         = "#eceff4"
theme.sbar_bg         = "#2e3440"

-- Downloadbar specific
theme.dbar_fg         = "#eceff4"
theme.dbar_bg         = "#2e3440"
theme.dbar_error_fg   = "#bf616a"

-- Input bar specific
theme.ibar_fg           = "#eceff4"
theme.ibar_bg           = "#2e3440"

-- Tab label
theme.tab_fg            = "#eceff4"
theme.tab_bg            = "#2e3440"
theme.tab_hover_bg      = "#3b4252"
theme.tab_ntheme        = "#d8dee9"
theme.selected_fg       = "#e5e9f0"
theme.selected_bg       = "#4c566a"
theme.selected_ntheme   = "#d8dee9"
theme.loading_fg        = "#88c0d0"
theme.loading_bg        = "#2e3440"

theme.selected_private_tab_bg = "#b48ead"
theme.private_tab_bg    = "#2e3440"

-- Trusted/untrusted ssl colours
theme.trust_fg          = "#a3be8c"
theme.notrust_fg        = "#bf616a"

-- Follow mode hints
theme.hint_font = "20px Fantasque Sans Mono"
theme.hint_fg = "#2e3440"
theme.hint_bg = "#81a1c1"
theme.hint_border = "2px #d8dee9"
theme.hint_opacity = "0.3"
theme.hint_overlay_bg = "#ebcb8b"
theme.hint_overlay_border = "2px #d8dee9"
theme.hint_overlay_selected_bg = "#a3be8c"
theme.hint_overlay_selected_border = theme.hint_overlay_border

-- General colour pairings
theme.ok = { fg = "#eceff4", bg = "#2e3440" }
theme.warn = { fg = "#bf616a", bg = "#eceff4" }
theme.error = { fg = "#bf616a", bg = "#2e3440" }

return theme

-- vim: et:sw=4:ts=8:sts=4:tw=80
