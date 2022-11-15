-- hs.window.setFrameCorrectness = true
-- hs.window.animationDuration = 0

local function move_win(xx, yy, ww, hh)
  return function()
    local win = hs.window.focusedWindow()
    
    if win == nil then
      win = hs.window.frontmostWindow()
    end

    local f = win:frame()
    local max = win:screen():frame()
    
    win:setFrame({ x = max.x + max.w * xx,
                   y = max.y + max.h * yy,
                   w = max.w * ww,
                   h = max.h * hh}, 0)
  end
end

local function maximize_win()
  return function()
    local win = hs.window.focusedWindow()
    hs.window.animationDuration = 0
    win:maximize()
  end
end

local function center_win()
  return function()
   local win = hs.window.focusedWindow()
    
   if win == nil then
      win = hs.window.frontmostWindow()
   end

   local f = win:frame()
   local max = win:screen():frame()
   f.x = max.x + (max.w - f.w) / 2
   f.y = max.y + (max.h - f.h) / 2
   
   win:setFrame(f, 0)
  end
end

return {
  ['top']	= move_win(0, 0, 1, 1/2),
  ['bottom']	= move_win(0, 1/2, 1, 1/2),
  ['right']	= move_win(1/2, 0, 1/2, 1),
  ['left']	= move_win(0, 0, 1/2, 1),
  ['center']	= center_win(),
  ['maximize']	= maximize_win()
}
