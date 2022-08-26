local Settings = {} -- Settings table for, well, settings.
Settings.JumpValue = 50 -- Player Jumppower limit.
Settings.SpeedValue = 16 -- Player Walkspeed limit.
Settings.GlobalLimit = 0 -- Limit of _G variables.
Settings.KickMessage = "Luaware anticheat detected multiple unwanted LocalScript instances on your client. This may be due to a script error, or a modification of your client. Due to the increased risk of cheaters in games on the platform, we have banned your account for the safety and experience of other players. If you would like to appeal this ban, please appeal at lua-ware.000webhostapp.com/appeals" -- Message that appears when the player is kicked.

spawn(function()
    while wait(1) do -- Every 1 second, this code is ran
        for i, v in next, _G do -- Loop through the global environment.
            if i ~= Settings.GlobalLimit then -- If the amount of global variables > Global Variable Limit then...
                print("Multiple unwanted _G instances, disconnecting client.")
                game.Players.LocalPlayer:Kick(Settings.KickMessage)
            end
        end
    end
end)

spawn(function()
    while wait() do -- Every 0.1 seconds, this code is ran
        if not game.Players.LocalPlayer:FindFirstChildOfClass("Humanoid") then -- If no humanoid found in player then...
            print("No humanoid found in game.Players.LocalPlayer:FindFirstChildOfClass('Humanoid'), disconnecting client.")
            game.Players.LocalPlayer:Kick(Settings.KickMessage)
        end
    end
end)

game:GetService("CoreGui").ChildAdded:Connect(function(obj) -- When an object is added inside here, fire the event.
    if obj.Name ~= "Roblox" then -- If the name isn't a Roblox CoreGui object, then...
        print("Unwanted instances found in game.CoreGui, disconnecting client.")
        game.Players.LocalPlayer:Kick(Settings.KickMessage)
    end
end)

game.Players.LocalPlayer.Character.Humanoid.WalkSpeed.OnValueChanged:Connect(function(v) -- When the walkspeed is changed, fire the event.
    if game.Players.LocalPlayer.Character.Humanoid.WalkSpeed.Value >= SpeedValue then -- If the walkspeed is equal to or bigger than the walkspeed limit, then...
        print("Player walkspeed has passed the maximum value ("..Settings.SpeedValue.. "), disconnecting client.")
        game.Players.LocalPlayer:Kick(Settings.KickMessage)
    end
end)

game.Players.LocalPlayer.Character.Humanoid.JumpPower.OnValueChanged:Connect(function(v) -- When the jumppower is changed, fire the event.
    if game.Players.LocalPlayer.Character.Humanoid.JumpPower.Value >= JumpValue then-- If the jumppower is equal to or bigger than the walkspeed limit, then...
        print("Player walkspeed has passed the maximum value ("..Settings.JumpValue.. "), disconnecting client.")
        game.Players.LocalPlayer:Kick(Settings.KickMessage)
    end
end)

-- Loaded message, will say the loaded time.
print("Anticheat loaded in Seconds seconds.")
print("Luaware Anticheat | v1.0.0")
