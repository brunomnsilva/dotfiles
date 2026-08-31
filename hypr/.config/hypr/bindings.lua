-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Disable default binds

hl.unbind("SUPER + W") -- close window
hl.unbind("SUPER + SHIFT + S") -- google maps?
hl.unbind("SUPER + E") -- unknown
hl.unbind("SUPER + SHIFT + F") -- Files


hl.unbind("SUPER + SHIFT + C") -- Calendar
hl.unbind("SUPER + SHIFT + E") --  Email
hl.unbind("SUPER + SHIFT + P") -- Google Photos
hl.unbind("SUPER + SHIFT + H") -- ??
hl.unbind("SUPER + SHIFT + K") -- ??
hl.unbind("SUPER + SHIFT + X") -- X
hl.unbind("SUPER + SHIFT + ALT + A") -- Grok
hl.unbind("SUPER + SHIFT + G") -- Signal
hl.unbind("SUPER + SHIFT + ALT + G") -- Whatsapp

-- APPLICATIONS
--
-- Logitech MX Keys examples:
-- o.bind("SUPER + H", nil, "voxtype record toggle")
o.bind("SUPER + period", nil, "omarchy-shell shell toggle omarchy.emojis")
o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")

o.bind("SUPER + E", "File manager", { omarchy = "nautilus" })
o.bind("SUPER + SHIFT + KP_Divide", "Bitwarden Passwords", { launch = "bitwarden-desktop"})
o.bind("SUPER + SHIFT + C", "Google Calendar", { webapp = "https://calendar.google.com/calendar/u/0/r/month?pli=1"})
o.bind("SUPER + SHIFT + H", "Home Assistant", { webapp = "http://homeassistant.local:8123/dashboard-mushroom/0"})
o.bind("SUPER + SHIFT + K", "Home Assistant", { webapp = "https://keep.google.com/"})
o.bind("SUPER + SHIFT + G", "WhatsApp", { webapp = "https://web.whatsapp.com/", focus = true })


-- TILING overrides

-- Close active window
o.bind("SUPER + Q", "Close window", hl.dsp.window.close())
--o.bind("SUPER + Q", "Close window", hl.dsp.exec_cmd("~/.config/hypr/scripts/close-window-confirm.sh"))

o.bind("SUPER + minus", "Expand window left", hl.dsp.window.resize({ x = -100, y = 0, relative = true }))
o.bind("SUPER + plus", "Shrink window left", hl.dsp.window.resize({ x = 100, y = 0, relative = true }))
o.bind("SUPER + SHIFT + minus", "Shrink window up", hl.dsp.window.resize({ x = 0, y = -100, relative = true }))
o.bind("SUPER + SHIFT + plus", "Expand window down", hl.dsp.window.resize({ x = 0, y = 100, relative = true }))

o.bind("SUPER + ALT + minus", "Expand window left a little", hl.dsp.window.resize({ x = -25, y = 0, relative = true }))
o.bind("SUPER + ALT + plus", "Shrink window left a little", hl.dsp.window.resize({ x = 25, y = 0, relative = true }))
o.bind("SUPER + SHIFT + ALT + minus", "Shrink window up a little", hl.dsp.window.resize({ x = 0, y = -25, relative = true }))
o.bind("SUPER + SHIFT + ALT + plus", "Expand window down a little", hl.dsp.window.resize({ x = 0, y = 25, relative = true }))

o.bind("SUPER + CTRL + minus", "Expand window left a lot", hl.dsp.window.resize({ x = -300, y = 0, relative = true }))
o.bind("SUPER + CTRL + plus", "Shrink window left a lot", hl.dsp.window.resize({ x = 300, y = 0, relative = true }))
o.bind("SUPER + CTRL + SHIFT + minus", "Shrink window up a lot", hl.dsp.window.resize({ x = 0, y = -300, relative = true }))
o.bind("SUPER + CTRL + SHIFT + plus", "Expand window down a lot", hl.dsp.window.resize({ x = 0, y = 300, relative = true }))

-- Switch workspaces with mainMod + numpad keys
-- Move active window to a workspace with mainMod + SHIFT + numpad keys
local numpadKeys = {
    "KP_End",   -- 1
    "KP_Down",  -- 2
    "KP_Next",  -- 3
    "KP_Left",  -- 4
    "KP_Begin", -- 5
    "KP_Right", -- 6
    "KP_Home",  -- 7
    "KP_Up",    -- 8
    "KP_Prior", -- 9
    "KP_Insert",-- 10
}

for i , key in ipairs(numpadKeys) do
    hl.bind("SUPER + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind("SUPER + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Switch workspaces with mouse wheel
-- hl.unbind("SUPER + mouse_down")
-- hl.unbind("SUPER + mouse_up")
hl.bind("CTRL + ALT + right", hl.dsp.focus({ workspace = "+1" }))
hl.bind("CTRL + ALT + left",   hl.dsp.focus({ workspace = "-1" }))


-- PLUGINS
-- Mirador plugin binding
hl.unbind("SUPER + TAB")
o.bind(
  "SUPER + TAB",
  "Workspace overview",
  "omarchy-shell shell toggle mirador '{}'"
)

-- Spotify
o.bind("SUPER + CTRL + SHIFT + M", "Spotify Plugin", "omarchy-shell shell toggle quickshell.spotify")



