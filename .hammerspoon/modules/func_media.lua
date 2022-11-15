local function bright_control(flag)
  return function()
    local current = hs.brightness.get()
    if flag == 1 then
      hs.brightness.set(current + 10)
      print('increase')
    else
      hs.brightness.set(current - 10)
      print('decrease')
    end
  end
end

return {
['bright_decrease'] = bright_control(-1),
['bright_increase'] = bright_control(1)
--[[
['music_prev'] =
['music_play_pause'] =
['music_next'] = 
['volumn_decrease'] =
['volumn_increase'] =
--]]
}
