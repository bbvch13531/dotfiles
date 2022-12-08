local wezterm = require 'wezterm'
local act = wezterm.action

return {
	font_size = 16,
  color_scheme = "Dracula+",
  hyperlink_rules = {
    {
      regex = '\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b',
      format = '$0',
    },
  },
	check_for_updates = false
}
