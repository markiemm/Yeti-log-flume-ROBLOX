local light = script.Parent.PointLight
while true do
	for count = 1, 20 do
		wait(0.1)
		light.Brightness = light.Brightness - 0.05
	end
	
	for count = 1, 20 do
		wait(0.1)
		light.Brightness = light.Brightness + 0.05
	end
end
