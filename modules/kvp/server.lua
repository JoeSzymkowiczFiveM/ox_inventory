if not lib then return end
local ludb = exports['0xludb-fivem']

local Query = {
    SELECT_STASH = 'SELECT data FROM ox_inventory WHERE owner = ? AND name = ?',
    UPDATE_STASH = 'UPDATE ox_inventory SET data = ? WHERE owner = ? AND name = ?',
    UPSERT_STASH = 'INSERT INTO ox_inventory (data, owner, name) VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE data = VALUES(data)',
    INSERT_STASH = 'INSERT INTO ox_inventory (owner, name) VALUES (?, ?)',
    SELECT_GLOVEBOX = 'SELECT plate, glovebox FROM `{vehicle_table}` WHERE `{vehicle_column}` = ?',
    SELECT_TRUNK = 'SELECT plate, trunk FROM `{vehicle_table}` WHERE `{vehicle_column}` = ?',
    SELECT_PLAYER = 'SELECT inventory FROM `{user_table}` WHERE `{user_column}` = ?',
    UPDATE_TRUNK = 'UPDATE `{vehicle_table}` SET trunk = ? WHERE `{vehicle_column}` = ?',
    UPDATE_GLOVEBOX = 'UPDATE `{vehicle_table}` SET glovebox = ? WHERE `{vehicle_column}` = ?',
    UPDATE_PLAYER = 'UPDATE `{user_table}` SET inventory = ? WHERE `{user_column}` = ?',
}

-- Citizen.CreateThreadNow(function()
--     local playerTable, playerColumn, vehicleTable, vehicleColumn

--     if shared.framework == 'ox' then
--         playerTable = 'character_inventory'
--         playerColumn = 'charid'
--         vehicleTable = 'vehicles'
--         vehicleColumn = 'id'
--     elseif shared.framework == 'esx' then
--         playerTable = 'users'
--         playerColumn = 'identifier'
--         vehicleTable = 'owned_vehicles'
--         vehicleColumn = 'plate'
--     elseif shared.framework == 'qb' then
--         playerTable = 'players'
--         playerColumn = 'citizenid'
--         vehicleTable = 'player_vehicles'
--         vehicleColumn = 'plate'
--     elseif shared.framework == 'nd' then
-- 		playerTable = 'nd_characters'
-- 		playerColumn = 'charid'
-- 		vehicleTable = 'nd_vehicles'
-- 		vehicleColumn = 'id'
--     end

--     for k, v in pairs(Query) do
--         Query[k] = v:gsub('{user_table}', playerTable):gsub('{user_column}', playerColumn):gsub('{vehicle_table}',
--             vehicleTable):gsub('{vehicle_column}', vehicleColumn)
--     end

--     Wait(0)

--     local success, result = pcall(MySQL.scalar.await, 'SELECT 1 FROM ox_inventory')

--     if not success then
--         MySQL.query([[CREATE TABLE `ox_inventory` (
-- 			`owner` varchar(60) DEFAULT NULL,
-- 			`name` varchar(100) NOT NULL,
-- 			`data` longtext DEFAULT NULL,
-- 			`lastupdated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
-- 			UNIQUE KEY `owner` (`owner`,`name`)
-- 		)]])
--     else
--         -- Shouldn't be needed anymore; was used for some data conversion for v2.5.0 (back in March 2022)
--         -- result = MySQL.query.await("SELECT owner, name FROM ox_inventory WHERE NOT owner = ''")

--         -- if result and next(result) then
--         -- 	local parameters = {}
--         -- 	local count = 0

--         -- 	for i = 1, #result do
--         -- 		local data = result[i]
--         -- 		local snip = data.name:sub(-#data.owner, #data.name)

--         -- 		if data.owner == snip then
--         -- 			local name = data.name:sub(0, #data.name - #snip)

--         -- 			count += 1
--         -- 			parameters[count] = { query = 'UPDATE ox_inventory SET `name` = ? WHERE `owner` = ? AND `name` = ?', values = { name, data.owner, data.name } }
--         -- 		end
--         -- 	end

--         -- 	if #parameters > 0 then
--         -- 		MySQL.transaction(parameters)
--         -- 	end
--         -- end
--     end

--     result = MySQL.query.await(('SHOW COLUMNS FROM `%s`'):format(vehicleTable))

--     if result then
--         local glovebox, trunk

--         for i = 1, #result do
--             local column = result[i]
--             if column.Field == 'glovebox' then
--                 glovebox = true
--             elseif column.Field == 'trunk' then
--                 trunk = true
--             end
--         end

--         if not glovebox then
--             MySQL.query(('ALTER TABLE `%s` ADD COLUMN `glovebox` LONGTEXT NULL'):format(vehicleTable))
--         end

--         if not trunk then
--             MySQL.query(('ALTER TABLE `%s` ADD COLUMN `trunk` LONGTEXT NULL'):format(vehicleTable))
--         end
--     end

--     success, result = pcall(MySQL.scalar.await, ('SELECT inventory FROM `%s`'):format(playerTable))

--     if not success then
--         MySQL.query(('ALTER TABLE `%s` ADD COLUMN `inventory` LONGTEXT NULL'):format(playerTable))
--     end

--     local clearStashes = GetConvar('inventory:clearstashes', '6 MONTH')

-- 	if clearStashes ~= '' then
-- 		pcall(MySQL.query.await, ('DELETE FROM ox_inventory WHERE lastupdated < (NOW() - INTERVAL %s)'):format(clearStashes))
-- 	end
-- end)

local db = {}

function db.loadPlayer(identifier)
    return ludb:retrieve("character_inventory/"..identifier) or {}
end

function db.savePlayer(owner, inventory)
    return ludb:save("character_inventory/"..owner, inventory)
end

function db.saveStash(owner, dbId, inventory)
    return ludb:save("stash_inventory/"..(owner and tostring(owner) or '').."/"..dbId, inventory)
end

function db.loadStash(owner, name)
    return ludb:retrieve("stash_inventory/"..(owner and tostring(owner) or '').."/"..name)
end

function db.saveGlovebox(id, inventory)
    return ludb:save("glovebox_inventory/"..id, inventory)
end

function db.loadGlovebox(id)
    return ludb:retrieve("glovebox_inventory/"..id)
end

function db.saveTrunk(id, inventory)
    return ludb:save("trunk_inventory/"..id, inventory)
end

function db.loadTrunk(id)
    return ludb:retrieve("trunk_inventory/"..id)
end

function db.deleteEvidence(name)
    return ludb:delete("ox_inventory/"..name)
end

---@param rows number | MySQLQuery | MySQLQuery[]
local function countRows(rows)
    if type(rows) == 'number' then return rows end

    local n = 0

    for i = 1, #rows do
        if rows[i] == 1 then n += 1 end
    end

    return n
end

---@param players InventorySaveData[]
---@param trunks InventorySaveData[]
---@param gloveboxes InventorySaveData[]
---@param stashes (InventorySaveData | string | number)[]
---@param total number[]
function db.saveInventories(players, trunks, gloveboxes, stashes, total)
    local start = os.nanotime()

    shared.info(('Saving %s inventories to the database'):format(total[5]))

    if total[1] > 0 then
        Citizen.CreateThreadNow(function()
            for i=1, #players do
                local player = players[i]
                ludb:save("character_inventory/"..player[2], player[1] or nil)
            end
            shared.info(('Saved %d/%d players (%.4f ms)'):format(#players, total[1], (os.nanotime() - start) / 1e6))
        end)
    end

    if total[2] > 0 then
        Citizen.CreateThreadNow(function()
            for i=1, #trunks do
                local trunk = trunks[i]
                ludb:save("vehicles/"..trunk[2], trunk[1] or {})
            end
            shared.info(('Saved %d/%d trunks (%.4f ms)'):format(#trunks, total[2], (os.nanotime() - start) / 1e6))
        end)
    end

    if total[3] > 0 then
        Citizen.CreateThreadNow(function()
            for i=1, #gloveboxes do
                local glovebox = gloveboxes[i]
                if glovebox[2] then
                    ludb:save("vehicles/"..glovebox[2], glovebox[1] or {})
                end
            end
            shared.info(('Saved %d/%d gloveboxes (%.4f ms)'):format(#gloveboxes, total[3], (os.nanotime() - start) / 1e6))
        end)
    end

    if total[4] > 0 then
        Citizen.CreateThreadNow(function()
            if server.bulkstashsave then
                total[4] /= 3
                for i=1, #stashes, 3 do
                    local stash = stashes[i]
                    local updateData = { lastupdated = os.time() }
                    if stash[i] then updateData.data = stash[i] end
                    if stash[i+1] then updateData.owner = stash[i+1] end
                    ludb:save("ox_inventory/"..stashes[i+2], updateData )
                end
                shared.info(('Saved %d/%d stashes (%.4f ms)'):format(#stashes, total[4], (os.nanotime() - start) / 1e6))
            else
                for i=1, #stashes do
                    local stash = stashes[i]
                    local updateData = {lastupdated = os.time()}
                    if stash[1] then updateData.data = stash[1] end
                    if stash[2] then updateData.owner = stash[2] end
                    ludb:save("ox_inventory/"..stash[3], updateData )
                end
                shared.info(('Saved %s/%s stashes (%.4f ms)'):format(#stashes, total[4], (os.nanotime() - start) / 1e6))
            end
        end)
    end

    -- All queries must run asynchronously on resource stop, so we'll await multiple promises instead.
    -- Citizen.Await(promise.all(promises))
end

return db
