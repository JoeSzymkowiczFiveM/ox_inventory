-- if not lib.checkDependency('ox_core', '0.21.3', true) then return end

-- local Ox = require '@ox_core.lib.init' --[[@as OxServer]]

local resourceName = 'ox_core'

if not GetResourceState(resourceName):find('start') then return end

do
	local file = ('imports/%s.lua'):format(lib.context)
	local import = LoadResourceFile(resourceName, file)

	if not import then return end

	local func, err = load(import, ('@@%s/%s'):format(resourceName, file))

	if not func or err then
		return error(err or ('unable to load %s'):format(resourceName))
	end

	func()
end

local Inventory = require 'modules.inventory.server'

AddEventHandler('ox:playerLogout', server.playerDropped)

AddEventHandler('ox:setGroup', function(source, name, grade)
	local inventory = Inventory(source)

	if not inventory then return end

	inventory.player.groups[name] = grade
end)

---@diagnostic disable-next-line: duplicate-set-field
function server.setPlayerData(player)
    player.groups = Ox.GetPlayer(player.source)?.getGroups()
    return player
end

---@diagnostic disable-next-line: duplicate-set-field
function server.hasLicense(inv, name)
	local player = Ox.GetPlayer(inv.id)

    if not player then return end

	return player.getLicense(name)
end

---@diagnostic disable-next-line: duplicate-set-field
function server.buyLicense(inv, license)
	local player = Ox.GetPlayer(inv.id)

    if not player then return end


	if player.getLicense(license.name) then
		return false, 'already_have'
	elseif Inventory.GetItemCount(inv, 'money') < license.price then
		return false, 'can_not_afford'
	end

	Inventory.RemoveItem(inv, 'money', license.price)
	player.addLicense(license.name)

	return true, 'have_purchased'
end

---@diagnostic disable-next-line: duplicate-set-field
function server.isPlayerBoss(playerId, group, grade)
	local groupData = GlobalState[('group.%s'):format(group)]

	return groupData and grade >= groupData.adminGrade
end

---@param entityId number
---@return number | string
---@diagnostic disable-next-line: duplicate-set-field
function server.getOwnedVehicleId(entityId)
    return Ox.GetVehicle(entityId)?.id
end
