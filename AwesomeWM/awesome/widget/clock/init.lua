local gears = require("gears")
local wibox = require("wibox")
local awful = require("awful")
local colorize = require("utils.function").colorize
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local icon = os.getenv("HOME") .. "/.config/awesome/widget/clock/icon.svg"

local M = {}

-- Clock
M.icon = wibox.widget.imagebox(colorize(icon, beautiful.widget_icon))

M.widget = wibox.widget.textclock(
    "<span color='#33272a'>%a, %I:%M %p</span>"
)

-- Calendar Widget
M.cal_shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, false, false, true, true, 12)
end

M.month_calendar = awful.widget.calendar_popup.month {
        start_sunday = false,
        spacing = dpi(10),
        font = beautiful.font,
        long_weekdays = true,
        margin = dpi(8), -- 10
        style_month = {border_width = 0, shape = cal_shape, padding = 25},
        style_header = {border_width = 0, bg_color = beautiful.black},
        style_weekday = {border_width = 0, bg_color = beautiful.black},
        style_normal = {border_width = 0, bg_color = beautiful.black},
        style_focus = {border_width = 0, bg_color = beautiful.widget_icon}
    }

-- Attach calentar to clock_widget
M.month_calendar:attach(M.widget, "tc", {on_pressed = true, on_hover = false})

return M
