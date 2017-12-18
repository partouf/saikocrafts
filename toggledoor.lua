
function toggledoor()
  local curval = component.redstone.getOutput(4)
  if curval == 255 then
    component.redstone.setOutput(4, 0)
  else
    component.redstone.setOutput(4, 255)
  end
end

toggledoor()
