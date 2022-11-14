local win_move = require('modules.winmove')

local win_move_event_map = {
  { key = "Up", mod = {'ctrl', 'option'}, func = win_move.top },
  { key = 'Down', mod = {'ctrl', 'option'}, func = win_move.bottom },
  { key = 'Right', mod = {'ctrl', 'option'}, func = win_move.right },
  { key = 'Left', mod = {'ctrl', 'option'}, func = win_move.left }
}

do
  for i, v in pairs(win_move_event_map) do
    local mod = v['mod']
    local lkey = v['key']
    local func = v['func']

    hs.hotkey.bind(mod, lkey, func)
  end

end

