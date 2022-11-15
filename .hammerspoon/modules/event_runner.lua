local obj = {}

function obj:init(func_table)
  local mode = hs.hotkey.modal.new()
  self.mode = mode

  function_table = func_table

  for i, v in pairs(function_table) do
    local mod = v['mod']
    local lkey = v['key']
    mode.bind(mod, lkey, v['func'])
  end
end

return obj
