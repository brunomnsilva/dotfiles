-- Learn how to configure Hyprland: https://wiki.hypr.land/Configuring/Start/

-- Omarchy's bootstrap keeps path setup out of this user config.
dofile((os.getenv("OMARCHY_PATH") or "/usr/share/omarchy") .. "/default/hypr/bootstrap.lua")

-- Disable all Omarchy default bindings. Add your own in hypr/bindings.lua.
-- omarchy_default_bindings = false
--
-- Or disable only bindings for Omarchy's preinstalled apps/web apps while
-- keeping core window-manager bindings:
-- omarchy_preinstalled_bindings = false

-- Load Omarchy defaults.
require("default.hypr.omarchy")

-- Put your personal overrides in these files. They're loaded after Omarchy's
-- defaults so package updates can improve the defaults without rewriting your
-- ~/.config/hypr files.
require("hypr.monitors")
require("hypr.input")
require("hypr.bindings")
require("hypr.looknfeel")
require("hypr.autostart")

-- Toggle config flags dynamically.
require("default.hypr.toggles")

-- Add any other personal Hyprland configuration below.

-- default workspaces

-- o.window("firefox", { workspace = "1" })
-- o.window("Spotify", { workspace = "8"})
-- o.window("chrome-web.whatsapp.com__-Default", { workspace = "9"})

-- app window modifications

o.window({ tag = "floating-window-big" }, { float = true })
o.window({ tag = "floating-window-big" }, { center = true })
o.window({ tag = "floating-window-big" }, { size = { "monitor_w * 0.7", "monitor_h * 0.8" } })

o.window("org.gnome.Calculator", { tag = "+floating-window"})

-- app window adjustments for larger screens

o.window("Bitwarden", { tag = "+floating-window-big"})
o.window("mpv", { tag = "+floating-window-big"})
o.window("imv", { tag = "+floating-window-big"})
o.window("org.omarchy.btop", { tag = "+floating-window-big"})
o.window("org.gnome.Evince", { tag = "+floating-window-big"})

-- virt-viewer: full opacity + open silently on workspace 9.
o.window("virt-viewer", {
  tag = "-default-opacity",
  opacity = "1 1",
  workspace = "9 silent",
})

-- File manager opens floating, centered at 70% x 50% of the monitor.
-- Note: float/size/center are static effects (applied at window open), so this
-- rule must float the window itself; it cannot react to a later float toggle.
o.window(
  { class = "org.gnome.Nautilus" },
  {
    float = true,
    size = { "monitor_w * 0.7", "monitor_h * 0.5" },
    center = true
  }
)

-- Solaar GUI opens floating, centered as a square covering 50% of the monitor width.
o.window(
  { class = "solaar" },
  {
    float = true,
    size = { "monitor_w * 0.5", "monitor_w * 0.5" },
    center = true
  }
)

-- Always show a groupbar-style title strip on LibreOffice documents.
o.window({ class = "^libreoffice-writer$" }, { group = "new" })
o.window({ class = "^libreoffice-calc$" },   { group = "new" })
o.window({ class = "^libreoffice-startcenter$" },   { group = "new" })

