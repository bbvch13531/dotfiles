-- hs.window.setFrameCorrectness = true
-- hs.window.animationDuration = 0

local function calc_size(direction)
    local win = hs.window.focusedWindow()
    
    if win == nil then
      win = hs.window.frontmostWindow()
    end

    local f = win:frame()
    local max = win:screen():frame()
    local new_width = max.w * 1/2
    local new_x = max.x

		local half = math.floor(max.w * 1/2)
		local one_third = math.floor(max.w * 1/3)
		local two_third = math.floor(max.w * 2/3)
    if direction == 0 then
			if f.w == half then
				new_width = two_third
			elseif f.w == two_third then
				new_width = one_third
			elseif f.w == one_third then
				new_width = half
			end
    else
      new_x = max.x + half
      if f.x == max.x + half then
	new_x = two_third
	new_width = two_third
      elseif f.x == two_third then
	new_x = two_third
	new_width = two_third
      elseif f.x == two_third then
	new_x = max.x + half
      end
    end

    return { xx = new_x, ww = new_width }
end

local function move_win(xx, yy, ww, hh)
  return function()
    local win = hs.window.focusedWindow()
    
    if win == nil then
      win = hs.window.frontmostWindow()
    end

    local f = win:frame()
    local max = win:screen():frame()

    if hh == 1 then
      local result = calc_size(xx)
      win:setFrame({ x = result["xx"],
                     y = max.y + max.h * yy,
                     w = result["ww"],
                     h = max.h * hh}, 0)
    else
      win:setFrame({ x = max.x + max.w * xx,
                     y = max.y + max.h * yy,
                     w = max.w * ww,
                     h = max.h * hh}, 0)
	     end
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
  ['top']		= move_win(0, 0, 1, 1/2),
  ['bottom']		= move_win(0, 1/2, 1, 1/2),
  ['right']		= move_win(1/2, 0, 1/2, 1),
  ['left']		= move_win(0, 0, 1/2, 1),
  ['top_right']		= move_win(1/2, 0, 1/2, 1/2),
  ['top_left']		= move_win(0, 0, 1/2, 1/2),
  ['bottom_right']	= move_win(1/2, 1/2, 1/2, 1/2),
  ['bottom_left']	= move_win(0, 1/2, 1/2, 1/2),
  ['center']		= center_win(),
  ['maximize']		= maximize_win()
}
