local awful = require("awful")

do
    local cmds = {
        "lxpolkit",
        "xautolock -time 15 -locker 'dm-tool lock;gpg-connect-agent reloadagent /bye'",
        "clipmenud",
        "xfce4-power-manager",
    }

    for _, i in pairs(cmds) do
        awful.spawn.with_shell(i .. "&")
    end
end
