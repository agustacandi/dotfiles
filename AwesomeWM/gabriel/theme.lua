---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

theme.font          = "ProductSans 9"

theme.bg_normal     = "#faeee7"
theme.bg_focus      = "#ff8ba7"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#33272a"
theme.fg_focus      = "#33272a"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.useless_gap         = dpi(3)
theme.border_width        = dpi(3)
theme.border_color_normal = "#ff8ba7"
theme.border_color_active = "#ff8ba7"
theme.border_color_marked = "#91231c"
theme.maximized_hide_border = false
theme.fullscreen_hide_border = false

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(0)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."gabriel/submenu.png"
theme.menu_height = dpi(25)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path.."gabriel/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = themes_path.."gabriel/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path.."gabriel/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path.."gabriel/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path.."gabriel/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."gabriel/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path.."gabriel/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = themes_path.."gabriel/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path.."gabriel/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path.."gabriel/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path.."gabriel/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = themes_path.."gabriel/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path.."gabriel/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path.."gabriel/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path.."gabriel/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = themes_path.."gabriel/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path.."gabriel/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."gabriel/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path.."gabriel/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = themes_path.."gabriel/titlebar/maximized_focus_active.png"

theme.wallpaper = themes_path.."gabriel/background.png"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."gabriel/layouts/fairh.png"
theme.layout_fairv = themes_path.."gabriel/layouts/fairv.png"
theme.layout_floating  = themes_path.."gabriel/layouts/floating.png"
theme.layout_magnifier = themes_path.."gabriel/layouts/magnifier.png"
theme.layout_max = themes_path.."gabriel/layouts/max.png"
theme.layout_fullscreen = themes_path.."gabriel/layouts/fullscreen.png"
theme.layout_tilebottom = themes_path.."gabriel/layouts/tilebottom.png"
theme.layout_tileleft   = themes_path.."gabriel/layouts/tileleft.png"
theme.layout_tile = themes_path.."gabriel/layouts/tile.png"
theme.layout_tiletop = themes_path.."gabriel/layouts/tiletop.png"
theme.layout_spiral  = themes_path.."gabriel/layouts/spiral.png"
theme.layout_dwindle = themes_path.."gabriel/layouts/dwindle.png"
theme.layout_cornernw = themes_path.."gabriel/layouts/cornernw.png"
theme.layout_cornerne = themes_path.."gabriel/layouts/cornerne.png"
theme.layout_cornersw = themes_path.."gabriel/layouts/cornersw.png"
theme.layout_cornerse = themes_path.."gabriel/layouts/cornerse.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

-- Set different colors for urgent notifications.
rnotification.connect_signal('request::rules', function()
    rnotification.append_rule {
        rule       = { urgency = 'critical' },
        properties = { bg = '#ff0000', fg = '#ffffff' }
    }
end)

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
