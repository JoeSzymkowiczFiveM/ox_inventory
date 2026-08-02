if not lib then return end

local CraftingBenches = {}
local Items = require 'modules.items.client'
local createBlip = require 'modules.utils.client'.CreateBlip
local Utils = require 'modules.utils.client'
local prompt = {
    options = { icon = 'fa-wrench' },
    message = ('**%s**  \n%s'):format(locale('open_crafting_bench'), locale('interact_prompt', GetControlInstructionalButton(0, 38, true):sub(3)))
}

---@param id number | string
---@param data table
---@param display? boolean
local function createCraftingBench(id, data, display)
	CraftingBenches[id] = {}
	local recipes = data.items

	if recipes then
		data.slots = #recipes

		for i = 1, data.slots do
			local recipe = recipes[i]
			local item = Items[recipe.name]

			if item then
				recipe.weight = item.weight
				recipe.slot = i
			else
				warn(('failed to setup crafting recipe (bench: %s, slot: %s) - item "%s" does not exist'):format(id, i, recipe.name))
			end
		end

		local blip = display ~= false and data.blip

		if blip then
			blip.name = blip.name or ('ox_crafting_%s'):format(data.label and id or 0)
			AddTextEntry(blip.name, data.label or locale('crafting_bench'))
		end

		if display == false then
			CraftingBenches[id] = data
		elseif shared.target then
			data.points = nil
            if data.zones then
    			for i = 1, #data.zones do
    				local zone = data.zones[i]
    				zone.name = ('craftingbench_%s:%s'):format(id, i)
    				zone.id = id
    				zone.index = i
    				zone.options = {
						{
    						label = zone.label or locale('open_crafting_bench'),
    						canInteract = (zone.groups or data.groups) and function()
    							return client.hasGroup(zone.groups or data.groups)
    						end or nil,
    						onSelect = function()
    							client.openInventory('crafting', { id = id, index = i })
    						end,
    						distance = zone.distance or 2.0,
    						icon = zone.icon or 'fas fa-wrench',
    					}
    				}

    				exports.ox_target:addBoxZone(zone)

    				if blip then
    					createBlip(blip, zone.coords)
    				end
    			end
            end
		elseif data.points then
			data.zones = nil

			for i = 1, #data.points do
				local coords = data.points[i]

				lib.points.new({
					coords = coords,
					distance = 16,
					benchid = id,
					index = i,
					inv = 'crafting',
                    prompt = prompt,
                    marker = client.craftingmarker,
					nearby = Utils.nearbyMarker
				})

				if blip then
					createBlip(blip, coords)
				end
			end
		end

		CraftingBenches[id] = data
	end
end

for id, data in pairs(lib.load('data.crafting') or {}) do createCraftingBench(data.name or id, data) end

local function registerCraftingBenches(benches)
	for id, bench in pairs(benches or {}) do
		if not CraftingBenches[id]?.items then
			local data = bench.data or bench
			local options = bench.options or {}

			createCraftingBench(id, data, options.display)
		end
	end
end

CreateThread(function()
	registerCraftingBenches(lib.callback.await('ox_inventory:getRegisteredCraftingBenches', false))
end)

AddStateBagChangeHandler('ox_inventory:registeredCraftingBenchesVersion', 'global', function()
	registerCraftingBenches(lib.callback.await('ox_inventory:getRegisteredCraftingBenches', false))
end)

return CraftingBenches
