plr = game.Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local binda = Instance.new("BindableFunction")

local function sendNotification(title, text, duration)
    StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration,
        Button1 = "Yes",
        Button2 = "No",
        Callback = binda
    })
end


local function scan()
    local succed = false
    for _, player in pairs(game.Players:GetPlayers()) do
        print(player.Name)
        for _, thingsin in pairs(player:GetChildren()) do
            print(player.Name .. " | " .. thingsin.Name)
            if thingsin.Name == "Backpack" then
                for _, tools in pairs(thingsin:GetChildren()) do
                    print(player.Name .. " | " .. thingsin.Name .. " | " .. tools.Name)
                    if tools.Name == "Build" or tools.Name == "Delete" or tools.Name == "Paint" or tools.Name == "Sign" or tools.Name == "Shape" or tools.Name == "Shovel" then
                        tools.Parent = plr.Backpack
                        succed = true
                    end
                end
            end
        end
    end
    if succed == true then
        sendNotification("Successful scan", "Would you like to rescan?", 5)
    else
        sendNotification("Fail scan", "Would you like to rescan?", 5)
    end
end

local function notifselected(response)
    if response == "Yes" then
        scan()
    elseif response == "No" then
        return
    end
end

binda.OnInvoke = notifselected

scan()
