-- Services
local ReplicatedStorage = game:GetService('ReplicatedStorage')

local SacrificeLib = require(ReplicatedStorage.SacrificeLib)

if Player:FindFirstChild('Sacrificed') and not Player:FindFirstChild('SecondSacrifice') then
    local CurrentIndex
    for i, Sacrifice in ipairs(SacrificeLib) do
        if Player:FindFirstChild(Sacrifice.Name) then
            CurrentIndex = i
        end
    end
    for i, Sacrifice in pairs(SacrificeLib[CurrentIndex]) do
        local ItemReturn = typeof(Sacrifice) == 'number'
        if ItemReturn then
            ItemReturn = Sacrifice
            for i, Info in pairs(SacrificeLib[CurrentIndex + 1]) do
                local NewSacrifice = string.match(Info, 'Sacrifice')
                if NewSacrifice then
                    NewSacrifice = Info
                    if not Player:FindFirstChild(NewSacrifice) and (OldLife < ItemReturn and Life >= ItemReturn) then
                        ServerStorage.ReturnItems:Invoke(Player)
                        ReplicatedStorage.Hint:FireClient(Player, 'Items were returned')
                    end
                end
            end
        end
    end    
else
    if not Player:FindFirstChild('Sacrificed') and (OldLife < 100 and Life >= 100) then
        ServerStorage.ReturnItems:Invoke(Player)
        ReplicatedStorage.Hint:FireClient(Player, 'Items were returned') 
    end                    
end
