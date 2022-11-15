local win_move = require('modules.winmove')
local event_runner = require('modules.event_runner')
local func_media = require('modules.func_media')

local win_move_event_map = {
  { key = 'Up', mod = {'ctrl', 'option'}, func = win_move.top },
  { key = 'Down', mod = {'ctrl', 'option'}, func = win_move.bottom },
  { key = 'Right', mod = {'ctrl', 'option'}, func = win_move.right },
  { key = 'Left', mod = {'ctrl', 'option'}, func = win_move.left },
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
