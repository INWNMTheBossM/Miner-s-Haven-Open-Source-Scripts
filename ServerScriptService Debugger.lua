-- Services
local ReplicatedStorage = game:GetService('ReplicatedStorage')

local Items = ReplicatedStorage:WaitForChild('Items')

local MissingPropertyValue = false

for Order, Item in pairs(Items:GetChildren()) do
	if not Item:FindFirstChild('Cost') or not Item:FindFirstChild('Description') or not Item:FindFirstChild('ItemId') or not Item:FindFirstChild('ItemType') then
		MissingPropertyValue = true
	end
	if MissingPropertyValue == true then
		warn(Item.Name, 'is missing a required property value!')
	end
end

print('There are a total amount of', #Items:GetChildren(), ' items in the game!')
