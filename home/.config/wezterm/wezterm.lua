-- ~/.config/wezterm/wezterm.lua
local wezterm = require("wezterm")
-- start in maximized window
wezterm.on("gui-startup", function(cmd)
	local _, _, window = wezterm.mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

return {
	-- Font settings
	font = wezterm.font("JetBrainsMono Nerd Font"),
	font_size = 16.0,

	-- Scrollback buffer size
	scrollback_lines = 10000,

	-- Tab bar position and style
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = true,

	-- Background transparency (optional)
	-- window_background_opacity = 0.7,

	-- Key bindings
	keys = {
		-- =========================
		-- Panes
		-- =========================

		-- Split top/bottom
		{
			key = "Enter",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SplitHorizontal({
				domain = "CurrentPaneDomain",
			}),
		},

		-- Split left/right
		{
			key = "|",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SplitVertical({
				domain = "CurrentPaneDomain",
			}),
		},

		-- Move between panes
		{
			key = "h",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ActivatePaneDirection("Left"),
		},
		{
			key = "j",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ActivatePaneDirection("Down"),
		},
		{
			key = "k",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ActivatePaneDirection("Up"),
		},
		{
			key = "l",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ActivatePaneDirection("Right"),
		},

		-- Close pane
		{
			key = "w",
			mods = "CTRL|SHIFT",
			action = wezterm.action.CloseCurrentPane({ confirm = true }),
		},

		-- =========================
		-- Tabs
		-- =========================

		-- New tab
		{
			key = "t",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SpawnTab("CurrentPaneDomain"),
		},

		-- Close tab
		{
			key = "q",
			mods = "CTRL|SHIFT",
			action = wezterm.action.CloseCurrentTab({ confirm = true }),
		},

		-- Previous / next tab
		{
			key = "LeftArrow",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ActivateTabRelative(-1),
		},
		{
			key = "RightArrow",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ActivateTabRelative(1),
		},

		-- =========================
		-- Other
		-- =========================

		-- Reload configuration
		{
			key = "r",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ReloadConfiguration,
		},

		-- Search scrollback
		{
			key = "f",
			mods = "CTRL|SHIFT",
			action = wezterm.action.Search("CurrentSelectionOrEmptyString"),
		},

		-- Enter copy mode
		{
			key = "Space",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ActivateCopyMode,
		},
	},

	-- =========================
	-- Colors
	-- =========================

	colors = {
		foreground = "#777777",
		background = "#000000",

		selection_fg = "#745b00",
		selection_bg = "#464646",

		ansi = {
			"#000000",
			"#b10b00",
			"#007232",
			"#745b00",
			"#3123ff",
			"#9b0097",
			"#006a78",
			"#777777",
		},

		brights = {
			"#464646",
			"#ff3d2b",
			"#00ae50",
			"#b18c00",
			"#6786ff",
			"#eb00e4",
			"#00a3b7",
			"#ababab",
		},

		tab_bar = {
			background = "#330033",

			active_tab = {
				bg_color = "#ff6600",
				fg_color = "#000000",
			},

			inactive_tab = {
				bg_color = "#a87ab8",
				fg_color = "#444444",
			},

			inactive_tab_hover = {
				bg_color = "#a87ab8",
				fg_color = "#444444",
			},
		},
	},
}
