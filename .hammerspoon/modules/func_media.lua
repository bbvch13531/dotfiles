local function bright_control(flag)
  return function()
    local current = hs.brightness.get()
    if flag == 1 then
      hs.eventtap.event.newSystemKeyEvent('BRIGHTNESS_UP', true):post()
      hs.eventtap.event.newSystemKeyEvent('BRIGHTNESS_UP', false):post()
      print('increase')
    else
      hs.eventtap.event.newSystemKeyEvent('BRIGHTNESS_DOWN', true):post()
      hs.eventtap.event.newSystemKeyEvent('BRIGHTNESS_DOWN', false):post()
      print('decrease')
    end
  end
end

local function music_control(flag)
  return function()
    if flag == -1 then
      hs.eventtap.event.newSystemKeyEvent('PREVIOUS', true):post()
      hs.eventtap.event.newSystemKeyEvent('PREVIOUS', false):post()
    elseif flag == 0 then
      hs.eventtap.event.newSystemKeyEvent('PLAY', true):post()
      hs.eventtap.event.newSystemKeyEvent('PLAY', false):post()
    else
      hs.eventtap.event.newSystemKeyEvent('NEXT', true):post()
      hs.eventtap.event.newSystemKeyEvent('NEXT', false):post()
    end
  end
end

local function volumn_control(flag)
  return function()
    if flag == 1 then
      hs.eventtap.event.newSystemKeyEvent('SOUND_UP', true):post()
      hs.eventtap.event.newSystemKeyEvent('SOUND_UP', false):post()
    else
       hs.eventtap.event.newSystemKeyEvent('SOUND_DOWN', true):post()
       hs.eventtap.event.newSystemKeyEvent('SOUND_DOWN', false):post()
    end
  end
end



return {
['bright_decrease'] = bright_control(-1),
['bright_increase'] = bright_control(1),
['music_prev'] = music_control(-1),
['music_play_pause'] = music_control(0),
['music_next'] =  music_control(1),
['volumn_decrease'] = volumn_control(-1),
['volumn_increase'] = volumn_control(1),
}
