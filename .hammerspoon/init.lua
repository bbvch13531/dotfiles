local win_move = require('modules.winmove')
local event_runner = require('modules.event_runner')
local func_media = require('modules.func_media')
local key_map = require('modules.key_map')

local win_move_event_map = {
  { key = 'Up', mod = {'ctrl', 'option'}, func = win_move.top },
  { key = 'Down', mod = {'ctrl', 'option'}, func = win_move.bottom },
  { key = 'Right', mod = {'ctrl', 'option'}, func = win_move.right },
  { key = 'Left', mod = {'ctrl', 'option'}, func = win_move.left },
  { key = 'I', mod = {'ctrl', 'option'}, func = win_move.top_right },
  { key = 'U', mod = {'ctrl', 'option'}, func = win_move.top_left },
  { key = 'K', mod = {'ctrl', 'option'}, func = win_move.bottom_right },
  { key = 'J', mod = {'ctrl', 'option'}, func = win_move.bottom_left },
  { key = 'return', mod = {'ctrl', 'option'}, func = win_move.maximize },
}

do
  for i, v in pairs(win_move_event_map) do
    local mod = v['mod']
    local lkey = v['key']
    local func = v['func']

    hs.hotkey.bind(mod, lkey, func)
  end
end
local func_media_event_map = {
  { key = 'f1', mod = {'ctrl'}, func = func_media.bright_decrease },
  { key = 'f2', mod = {'ctrl'}, func = func_media.bright_increase },
  { key = 'f8', mod = {'ctrl'}, func = func_media.music_prev },
  { key = 'f9', mod = {'ctrl'}, func = func_media.music_play_pause},
  { key = 'f10', mod = {'ctrl'}, func = func_media.music_next },
  { key = 'f11', mod = {'ctrl'}, func = func_media.volumn_decrease },
  { key = 'f12', mod = {'ctrl'}, func = func_media.volumn_increase },
}

do
  for i, v in pairs(func_media_event_map) do
    local mod = v['mod']
    local lkey = v['key']
    local func = v['func']

    hs.hotkey.bind(mod, lkey, func, nil, func)
  end
end

hs.hotkey.bind({"alt", "shift"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")

local esc_bind
local input_source_mode = hs.hotkey.modal.new()
local on_input_source_mode = function()
	input_source_mode:enter()
end

local off_input_source_mode = function()
	input_source_mode:exit()
	local win = hs.window.focusedWindow()
	local app = win:application()
	if app:title() == "WezTerm" then
		local input_source = hs.keycodes.currentSourceID()
		if input_source == "com.apple.inputmethod.Korean.2SetKorean" then
			hs.keycodes.currentSourceID("com.apple.keylayout.ABC")
		end
	end
		esc_bind:disable()
		hs.eventtap.keyStroke({}, 'escape')
		esc_bind:enable()
end
esc_bind = hs.hotkey.bind({}, 'escape', on_input_source_mode, off_input_source_mode, nil)
hs.hotkey.bind({'ctrl'}, '[', on_input_source_mode, off_input_source_mode, nil)
