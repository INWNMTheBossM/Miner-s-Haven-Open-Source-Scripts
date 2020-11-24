-- // Services

local ReplicatedStorage = game:GetService('ReplicatedStorage')

local Items = ReplicatedStorage:WaitForChild('Items')

local MissingAttribute = false

for Order, Item in pairs(Items:GetChildren()) do
	if not Item:FindFirstChild('Cost') or not Item:FindFirstChild('Description') or not Item:FindFirstChild('ItemId') or not Item:FindFirstChild('ItemType') then
		MissingAttribute = true
	end
	if MissingAttribute == true then
		warn(Item.Name, 'is missing a required attribute!')
	end
end

print('There are a total amount of', #Items:GetChildren(), ' items in the game!')
