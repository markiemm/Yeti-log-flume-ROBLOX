local Preshow_running = true
local warninglights = false
--Exit Door
local LeftDoor_Exit_Door = game.Workspace.Lab.Preshow.Doors.DoubleDoorExit.ScriptedComponents.LeftDoor
local RightDoor_Exit_Door = game.Workspace.Lab.Preshow.Doors.DoubleDoorExit.ScriptedComponents.RightDoor
local Open_Exit_Door = false
local OpenSound_Exit_Door = game.Workspace.Lab.Preshow.Doors.DoubleDoorExit.ScriptedComponents.LeftDoor.DoorOpen
local CloseSound_Exit_Door = game.Workspace.Lab.Preshow.Doors.DoubleDoorExit.ScriptedComponents.LeftDoor.DoorClose
local Debounce_Exit_Door = false


--Entrance Door
local LeftDoor_Entrance_Door = game.Workspace.Lab.Preshow.Doors.DoubleDoorEntrance.ScriptedComponents.LeftDoor
local RightDoor_Entrance_Door = game.Workspace.Lab.Preshow.Doors.DoubleDoorEntrance.ScriptedComponents.RightDoor
local Open_Entrance_Door = false
local OpenSound_Entrance_Door = game.Workspace.Lab.Preshow.Doors.DoubleDoorEntrance.ScriptedComponents.LeftDoor.DoorOpen
local CloseSound_Entrance_Door = game.Workspace.Lab.Preshow.Doors.DoubleDoorEntrance.ScriptedComponents.LeftDoor.DoorClose
local Debounce_Entrance_Door = false

--tv's
local TV_Left = script.Parent.TV.Left.Front.SurfaceGui.Frame.ImageLabel
local TV_Right = script.Parent.TV.Right.Front.SurfaceGui.Frame.ImageLabel

--lights
local Roof_Light = script.Parent.Lights.Roof_Light.PointLight
local Outside_Light = script.Parent.Lights.Outside_Light.SpotLight
local lightbrick = script.Parent.Lights.Roof_Light
local Warning_Light = script.Parent.Lights.EmergencyLight.Toggle

--Speaker
local Speaker_idle = script.Parent.Speaker.Idle
local Speaker_Voice = script.Parent.Speaker.PreshowVoice
local Speaker_Music = script.Parent.Speaker.Preshowbackgroundmusic
local Speaker_Power_Down = script.Parent.Speaker.Power_Down
local Speaker_Suprise = script.Parent.Speaker.Suprise
local Speaker_Roar = script.Parent.Speaker.Roar
local Speaker_Horror_Music = script.Parent.Speaker.Horror_Music
local Alarm = script.Parent.Speaker.Alarm
local Lockdown = script.Parent.Speaker.Lockdown

--Outside TV
local Header = script.Parent.Outside_TV.Front.SurfaceGui.Background.Header.TextLabel
local body = script.Parent.Outside_TV.Front.SurfaceGui.Background.Body
local loading = script.Parent.Outside_TV.Front.SurfaceGui.Background.Loading
local Arrow = script.Parent.Outside_TV.Front.SurfaceGui.Background.Arrow

--shuttters
local Shutters = script.Parent.Parent.Shutters

--yeti
local eye1 = script.Parent.Yeti.Eyes.Base.Eye1
local eye2 = script.Parent.Yeti.Eyes.Base.Eye2
local baseeyes = script.Parent.Yeti.Eyes.Base


function Toggle_Exit_Door()
	if not Debounce_Exit_Door then
		Debounce_Exit_Door = true
		if Open_Exit_Door then
			Open_Exit_Door = false
			CloseSound_Exit_Door:Play()
			spawn(function()
				for i = 1, 60 do
					LeftDoor_Exit_Door.CFrame = LeftDoor_Exit_Door.CFrame + (LeftDoor_Exit_Door.CFrame.lookVector * 0.1)
					wait(0.05)
				end
			end)
			spawn(function()
				for i = 1, 60 do
					RightDoor_Exit_Door.CFrame = RightDoor_Exit_Door.CFrame + (RightDoor_Exit_Door.CFrame.lookVector * 0.1)
					wait(0.05)
				end
			end)
		else
			Open_Exit_Door = true
			OpenSound_Exit_Door:Play()
			spawn(function()
				for i = 1, 60 do
					LeftDoor_Exit_Door.CFrame = LeftDoor_Exit_Door.CFrame - (LeftDoor_Exit_Door.CFrame.lookVector * 0.1)
					wait(0.05)
				end
			end)
			spawn(function()
				for i = 1, 60 do
					RightDoor_Exit_Door.CFrame = RightDoor_Exit_Door.CFrame - (RightDoor_Exit_Door.CFrame.lookVector * 0.1)
					wait(0.05)
				end
			end)
		end
		wait(2.5)
		Debounce_Exit_Door = false
	end
end

function Toggle_Entrance_Door()
	if not Debounce_Entrance_Door then
		Debounce_Entrance_Door = true
		if Open_Entrance_Door then
			Open_Entrance_Door = false
			CloseSound_Entrance_Door:Play()
			spawn(function()
				for i = 1, 60 do
					LeftDoor_Entrance_Door.CFrame = LeftDoor_Entrance_Door.CFrame + (LeftDoor_Entrance_Door.CFrame.lookVector * 0.1)
					wait(0.05)
				end
			end)
			spawn(function()
				for i = 1, 60 do
					RightDoor_Entrance_Door.CFrame = RightDoor_Entrance_Door.CFrame + (RightDoor_Entrance_Door.CFrame.lookVector * 0.1)
					wait(0.05)
				end
			end)
		else
			Open_Entrance_Door = true
			OpenSound_Entrance_Door:Play()
			spawn(function()
				for i = 1, 60 do
					LeftDoor_Entrance_Door.CFrame = LeftDoor_Entrance_Door.CFrame - (LeftDoor_Entrance_Door.CFrame.lookVector * 0.1)
					wait(0.05)
				end
			end)
			spawn(function()
				for i = 1, 60 do
					RightDoor_Entrance_Door.CFrame = RightDoor_Entrance_Door.CFrame - (RightDoor_Entrance_Door.CFrame.lookVector * 0.1)
					wait(0.05)
				end
			end)
		end
		wait(2.5)
		Debounce_Entrance_Door = false
	end
end

function Get_Room_Ready()
	Toggle_Entrance_Door()
	Roof_Light.Range = 27
	Outside_Light.Range = 30
	Speaker_idle.SoundId = "rbxassetid://1837188409"
	Speaker_idle:Play()
end


function Lower_Idle_Music()
	repeat
		Speaker_idle.Volume = Speaker_idle.Volume - 0.01
		wait(0.1)
	until Speaker_idle.Volume == 0
	
end

function Lower_Brightness()
	repeat
		wait(0.1)
		Roof_Light.Brightness = Roof_Light.Brightness - .1
	until Roof_Light.Brightness <= 0.3
	
end


function Power_Down()
	Speaker_Power_Down:Play()
	Speaker_Voice:Stop()
	Speaker_Music:Stop()
end

function Lower_Shutters()
	for i = 1, 150 do
		Shutters.CFrame = Shutters.CFrame + (Shutters.CFrame.lookVector * 0.1)
		wait(0.05)
		end
end

function Brighten_outside()
	repeat Outside_Light.Brightness = Outside_Light.Brightness +0.05
		wait(0.05)
		
	until Outside_Light.Brightness >= 6
end

function Move_Eyes()
	wait(1)
	for i = 1, 80 do
		baseeyes.CFrame = baseeyes.CFrame + (baseeyes.CFrame.lookVector * 0.1)
		wait(0.05)
	end
end

function Reset_Room()
	Speaker_Voice:Stop()
	wait(0.5)
	Speaker_Music:Stop()
	wait(0.5)
	Speaker_Power_Down:Stop()
	wait(0.5)
	Speaker_Roar:Stop()
	wait(0.5)
	Speaker_Suprise:Stop()
	wait(0.5)
	Speaker_Horror_Music:Stop()
	wait(0.5)
	Alarm:Stop()
	wait(0.5)
	Lockdown:Stop()
	wait(0.5)
	Warning_Light.Value = false
	wait(0.5)
	lightbrick.Transparency = 0
	wait(0.5)
	Roof_Light.Brightness = 1.4
	wait(0.5)
	TV_Left.Image = "rbxgameasset://Images/yeti-bigfoot"
	TV_Right.Image = "rbxgameasset://Images/yeti-bigfoot"
	wait(0.5)
	Roof_Light.Range = 27
	wait(0.5)
	Outside_Light.Brightness = 0
	wait(0.5)
	Outside_Light.Range = 36
	wait(0.5)
	eye1.Transparency = 1
	eye2.Transparency = 1
	wait(0.5)
	Speaker_idle.Volume = 0.5
	wait(0.5)
	warninglights = false
	wait(0.5)
	for i = 1, 80 do
		baseeyes.CFrame = baseeyes.CFrame + (baseeyes.CFrame.lookVector * - 0.1)
		wait(0.05)
		end
	wait(1)
	Toggle_Entrance_Door()
end


function Raise_Shutters()
	for i = 1, 150 do
		Shutters.CFrame = Shutters.CFrame + (Shutters.CFrame.lookVector * -0.1)
		wait(0.05)
		end
end

function Play_Alert()
	Lockdown:Play()
	repeat
		if Lockdown.IsPlaying == true then
			wait(1)
		end
			
	until Lockdown.IsPlaying == false
	Lockdown:Play()
end

function Exit_Lights()
	while warninglights == true do
		local timer = 0.5
		local Light1_Model = script.Parent.Parent.Preshow.Doors.DoorLights.Light1
		local Light2_Model = script.Parent.Parent.Preshow.Doors.DoorLights.Light2
		local Light3_Model = script.Parent.Parent.Preshow.Doors.DoorLights.Light3
		local Light4_Model = script.Parent.Parent.Preshow.Doors.DoorLights.Light4
		local Light1 = script.Parent.Parent.Preshow.Doors.DoorLights.Light1.PointLight
		local Light2 = script.Parent.Parent.Preshow.Doors.DoorLights.Light2.PointLight
		local Light3 = script.Parent.Parent.Preshow.Doors.DoorLights.Light3.PointLight
		local Light4 = script.Parent.Parent.Preshow.Doors.DoorLights.Light4.PointLight
		
		Light1_Model.Material = "Neon"
		Light2_Model.Material = "Neon"
		Light3_Model.Material = "Neon"
		Light4_Model.Material = "Neon"
		
		Light1.Enabled = true
		Light2.Enabled = true
		Light3.Enabled = true
		Light4.Enabled = true
		
		wait(timer)
		
		Light1_Model.Material = "Glass"
		Light2_Model.Material = "Glass"
		Light3_Model.Material = "Glass"
		Light4_Model.Material = "Glass"
		
		Light1.Enabled = false
		Light2.Enabled = false
		Light3.Enabled = false
		Light4.Enabled = false
		
		wait(timer)
		end
end

function Preshow_Ready()
	wait(15)
	Header.Text = "Please Come in!"
	body.Text = "Your tour is ready."
	loading.Visible = false
	Arrow.Visible = true
end

function Preshow_Running_message()
	Header.Text = "Please wait here!"
	body.Text = "Preshow in progress..."
	loading.Visible = true
	Arrow.Visible = false

end

Get_Room_Ready()

while true do -- main
spawn(Preshow_Ready)
wait(20)
Toggle_Entrance_Door()
spawn(Preshow_Running_message)
Lower_Idle_Music()
Lower_Brightness()
	
wait(1)
Speaker_Voice:Play()

wait(4.5)
Speaker_Music:Play()
	
wait(18)
	
TV_Left.Image = "rbxgameasset://Images/Yeti"
TV_Right.Image = "rbxgameasset://Images/Yeti"
	
wait(4)	
TV_Left.Image = "rbxgameasset://Images/line_up3"
TV_Right.Image = "rbxgameasset://Images/line_up3"
	
wait(5)
TV_Left.Image = "rbxgameasset://Images/mountian"
TV_Right.Image = "rbxgameasset://Images/mountian"
	
wait(4)
spawn(Lower_Shutters)
TV_Left.Image = "rbxgameasset://Images/yeti-bigfoot"
TV_Right.Image = "rbxgameasset://Images/yeti-bigfoot"
wait(5)
spawn(Brighten_outside)
wait(10)
for count = 1, 30 do
	wait(.1)
	local Lightflicker = math.random(24, 30)
	Roof_Light.Range = (Lightflicker)
	
	local roof_flicker = math.random(0.55, 0.85)
	lightbrick.Transparency = (roof_flicker)
end

Speaker_Voice:Stop()
Speaker_Music:Stop()
Speaker_Power_Down:Play()
lightbrick.Transparency = 1
Roof_Light.Range = 0
Outside_Light.Brightness = 0

wait(3)
Speaker_Suprise:Play()
wait(0.9)
eye1.Transparency = 0
eye2.Transparency = 0
wait(1)
Speaker_Roar:Play()
Speaker_Horror_Music:Play()
spawn(Move_Eyes)
wait(4)
spawn(Raise_Shutters)
TV_Left.Image = "rbxgameasset://Images/warning"
TV_Right.Image = "rbxgameasset://Images/warning"
Warning_Light.Value = true
Alarm:Play()
spawn(Play_Alert)
wait(15)
warninglights = true	
spawn(Exit_Lights)
wait(2)
spawn(Toggle_Exit_Door)
wait(30)
spawn(Toggle_Exit_Door)
spawn(Reset_Room)
end
