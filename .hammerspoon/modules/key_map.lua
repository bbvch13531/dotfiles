local function input_source_en()
  return function()
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
				print("Not wezterm")
		end
		esc_bind = hs.hotkey.bind({}, 'escape', on_input_source_mode, off_input_source_mode, nil)
		hs.hotkey.bind({'ctrl'}, '[', on_input_source_mode, off_input_source_mode, nil)
  end
end

return {
	['test'] = input_source_en()
}
