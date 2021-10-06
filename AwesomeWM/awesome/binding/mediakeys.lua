local awful = require("awful")
local gears = require("gears")

local M = {}

function M.get()
	local globalkeys = gears.table.join(
		awful.key(
			{},
			"XF86MonBrightnessDown",
			function()
				awful.spawn.with_shell("brightnessctl s 5%-")
			end,
			{description = "decrease brightness", group = "brightness"}
		),
		awful.key(
			{},
			"XF86MonBrightnessUp",
			function()
				awful.spawn.with_shell("brightnessctl s 5%+")
			end,
			{description = "increase brightness", group = "brightness"}
		)
	)
	
	return globalkeys
end

return setmetatable({}, { __call = function(_, ...) return M.get(...) end })
