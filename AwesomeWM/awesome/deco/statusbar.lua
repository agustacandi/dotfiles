-- Standard awesome library
local gears = require("gears")
local awful     = require("awful")

-- Wibox handling library
local wibox = require("wibox")
local func = require("utils.function")
local beautiful = require("beautiful")

-- Custom Local Library: Common Functional Decoration
local deco = {
  wallpaper = require("deco.wallpaper"),
  taglist   = require("deco.taglist"),
  tasklist  = require("deco.tasklist")
}

local taglist_buttons  = deco.taglist()
local tasklist_buttons = deco.tasklist()

-- Modules
local taglist = require("widget.taglist")
local systray = require("widget.systray")
local clock = require("widget.clock")
local cpu = require("widget.cpu")
local memory = require("widget.memory")
local netspeed = require("widget.netspeed")
local temp = require("widget.temp")
local tasklist = require("widget.tasklist")
local volume = require("widget.volume")
local brightness = require("widget.brightness")

local dpi = beautiful.xresources.apply_dpi
local margin = wibox.container.margin

local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock()

awful.screen.connect_for_each_screen(function(s)
  -- Wallpaper
  set_wallpaper(s)

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()

  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(gears.table.join(
    awful.button({ }, 1, function () awful.layout.inc( 1) end),
    awful.button({ }, 3, function () awful.layout.inc(-1) end),
    awful.button({ }, 4, function () awful.layout.inc( 1) end),
    awful.button({ }, 5, function () awful.layout.inc(-1) end)
  ))

  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = taglist_buttons
  }

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist {
    screen  = s,
    filter  = awful.widget.tasklist.filter.currenttags,
    buttons = tasklist_buttons
  }

  -- Create the wibox
  s.mywibox = awful.wibar({ position = "top", screen = s, height = 23 })

  -- Add widgets to the wibox
  s.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    { -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      RC.launcher,
      taglist.widget(s),
      s.mypromptbox,
    },
    --s.mytasklist, -- Middle widget
    tasklist.widget(s),
    { -- Right widgets
      layout = wibox.layout.fixed.horizontal,
      --wibox.widget.systray(),
      
      func.icon_wrapper(netspeed.network_icon, 5, 5, 5, 5),
      func.icon_wrapper(netspeed.down_icon),
      func.text_wrapper(netspeed.down),
      func.icon_wrapper(netspeed.up_icon),
      func.text_wrapper(netspeed.up),
      
      func.icon_wrapper(temp.icon),
      func.text_wrapper(temp.widget),
      
      func.icon_wrapper(cpu.icon),
      func.text_wrapper(cpu.widget),
      
      func.icon_wrapper(memory.icon),
      func.text_wrapper(memory.widget),
      
      func.icon_wrapper(brightness.icon, 6, 6, 6, 6),
      func.text_wrapper(brightness.widget),
      
      func.icon_wrapper(volume.icon),
      func.text_wrapper(volume.widget),
      
      func.icon_wrapper(clock.icon, 5, 5, 5, 5),
      func.text_wrapper(clock.widget),
      s.mylayoutbox,
      margin(systray.widget, dpi(0), dpi(2), dpi(4), dpi(4)),
    },
  }
end)
-- }}}

