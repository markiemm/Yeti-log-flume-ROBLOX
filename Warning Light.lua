sp=script.Parent


bulb=sp:WaitForChild("Bulb")
part1=sp:WaitForChild("Part1")
light1=part1:WaitForChild("SpotLight")
part2=sp:WaitForChild("Part2")
light2=part2:WaitForChild("SpotLight")
toggle=sp:WaitForChild("Toggle")


function updatetoggle()
	bulb.BrickColor=(toggle.Value and BrickColor.new("Really red")) or BrickColor.new("Mid gray")
	light1.Enabled=toggle.Value
	light2.Enabled=toggle.Value
end


toggle.Changed:connect(updatetoggle)
updatetoggle()




rate=1/30
rps=1
currentrotation=math.random()

while true do
	wait(.1)
	while toggle.Value do
		wait(rate)
		currentrotation=currentrotation+(rps*rate)
		part1.CFrame=((bulb.CFrame*CFrame.Angles(0,math.pi*2*currentrotation,0))*CFrame.Angles(0,0,math.pi*.5))*CFrame.new(0,0,part1.Size.z*.5)
		part2.CFrame=((bulb.CFrame*CFrame.Angles(0,math.pi*2*(currentrotation+.5),0))*CFrame.Angles(0,0,math.pi*.5))*CFrame.new(0,0,part2.Size.z*.5)
	end
end



