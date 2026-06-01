if not lib then return end

-- Parses a MySQL-style interval string (e.g. "6 MONTH") into a ChiliadDB retention table.
local function parseIntervalToRetention(intervalStr)
    local amount, unit = intervalStr:match('^(%d+)%s+(%a+)$')
    if not amount or not unit then return nil end
    amount = tonumber(amount)
    unit = unit:upper()
    local retention = {}
    if unit == 'SECOND' or unit == 'SECONDS' then
        retention.seconds = amount
    elseif unit == 'MINUTE' or unit == 'MINUTES' then
        retention.minutes = amount
    elseif unit == 'HOUR' or unit == 'HOURS' then
        retention.hours = amount
    elseif unit == 'DAY' or unit == 'DAYS' then
        retention.days = amount
    elseif unit == 'WEEK' or unit == 'WEEKS' then
        retention.days = amount * 7
    elseif unit == 'MONTH' or unit == 'MONTHS' then
        retention.months = amount
    elseif unit == 'YEAR' or unit == 'YEARS' then
        retention.months = amount * 12
    else
        return nil
    end
    return retention
end

-- Collections:
--   ox_player_inventories  { owner, inventory }
--   ox_stash_inventories   { owner, name, data }
--   ox_vehicle_inventories { vehicleId, glovebox, trunk }
ChiliadDB.ready(function()
    ChiliadDB.ensureIndex({ collection = 'ox_player_inventories', fields = { 'owner' }, unique = true })
    ChiliadDB.ensureIndex({ collection = 'ox_stash_inventories', fields = { 'owner', 'name' } })
    ChiliadDB.ensureIndex({ collection = 'ox_vehicle_inventories', fields = { 'vehicleId' }, unique = true })

    local clearStashes = GetConvar('inventory:clearstashes', '6 MONTH')
    if clearStashes ~= '' then
        local retention = parseIntervalToRetention(clearStashes)
        if retention then
            ChiliadDB.setCollectionRetention({ collection = 'ox_stash_inventories', retention = retention })
        end
    end
end)

db = {}

function db.loadPlayer(identifier)
    local doc = ChiliadDB.findOne({ collection = 'ox_player_inventories', query = { owner = identifier } })
    if not doc or not doc.inventory then return nil end
    return json.decode(doc.inventory)
end

function db.savePlayer(owner, inventory)
    return ChiliadDB.update({
        collection = 'ox_player_inventories',
        query = { owner = owner },
        update = { owner = owner, inventory = inventory },
        options = { upsert = true },
    })
end

function db.saveStash(owner, dbId, inventory)
    local ownerStr = owner and tostring(owner) or ''
    return ChiliadDB.update({
        collection = 'ox_stash_inventories',
        query = { owner = ownerStr, name = tostring(dbId) },
        update = { owner = ownerStr, name = tostring(dbId), data = inventory },
        options = { upsert = true },
    })
end

function db.loadStash(owner, name)
    local doc = ChiliadDB.findOne({ collection = 'ox_stash_inventories', query = { owner = owner, name = name } })
    return doc and doc.data
end

function db.saveGlovebox(id, inventory)
    return ChiliadDB.update({
        collection = 'ox_vehicle_inventories',
        query = { vehicleId = tostring(id) },
        update = { vehicleId = tostring(id), glovebox = inventory },
        options = { upsert = true },
    })
end

function db.loadGlovebox(id)
    local doc = ChiliadDB.findOne({ collection = 'ox_vehicle_inventories', query = { vehicleId = tostring(id) } })
    return doc and { glovebox = doc.glovebox }
end

function db.saveTrunk(id, inventory)
    return ChiliadDB.update({
        collection = 'ox_vehicle_inventories',
        query = { vehicleId = tostring(id) },
        update = { vehicleId = tostring(id), trunk = inventory },
        options = { upsert = true },
    })
end

function db.loadTrunk(id)
    local doc = ChiliadDB.findOne({ collection = 'ox_vehicle_inventories', query = { vehicleId = tostring(id) } })
    return doc and { trunk = doc.trunk }
end

local function safeQuery(fn, ...)
    local ok, resp = pcall(fn, ...)
    if not ok then
        return warn(resp)
    end
    return resp
end

---@param players InventorySaveData[]
---@param trunks InventorySaveData[]
---@param gloveboxes InventorySaveData[]
---@param stashes (InventorySaveData | string | number)[]
---@param total number[]
function db.saveInventories(players, trunks, gloveboxes, stashes, total)
    local start = os.nanotime()
    local saveStr = 'Saved %d/%d %s (%.4f ms)'
    local pending = 0

    shared.info(('Saving %s inventories to the database'):format(total[5]))

    if total[1] > 0 then
        pending += 1
        Citizen.CreateThreadNow(function()
            local saved = 0
            for i = 1, #players do
                local entry = players[i]
                local resp = safeQuery(ChiliadDB.update, {
                    collection = 'ox_player_inventories',
                    query = { owner = entry[2] },
                    update = { owner = entry[2], inventory = entry[1] },
                    options = { upsert = true },
                })
                if resp then saved += 1 end
            end
            pending -= 1
            shared.info(saveStr:format(saved, total[1], 'players', (os.nanotime() - start) / 1e6))
        end)
    end

    if total[2] > 0 then
        pending += 1
        Citizen.CreateThreadNow(function()
            local saved = 0
            for i = 1, #trunks do
                local entry = trunks[i]
                local resp = safeQuery(ChiliadDB.update, {
                    collection = 'ox_vehicle_inventories',
                    query = { vehicleId = tostring(entry[2]) },
                    update = { vehicleId = tostring(entry[2]), trunk = entry[1] },
                    options = { upsert = true },
                })
                if resp then saved += 1 end
            end
            pending -= 1
            shared.info(saveStr:format(saved, total[2], 'trunks', (os.nanotime() - start) / 1e6))
        end)
    end

    if total[3] > 0 then
        pending += 1
        Citizen.CreateThreadNow(function()
            local saved = 0
            for i = 1, #gloveboxes do
                local entry = gloveboxes[i]
                local resp = safeQuery(ChiliadDB.update, {
                    collection = 'ox_vehicle_inventories',
                    query = { vehicleId = tostring(entry[2]) },
                    update = { vehicleId = tostring(entry[2]), glovebox = entry[1] },
                    options = { upsert = true },
                })
                if resp then saved += 1 end
            end
            pending -= 1
            shared.info(saveStr:format(saved, total[3], 'gloveboxes', (os.nanotime() - start) / 1e6))
        end)
    end

    if total[4] > 0 then
        pending += 1
        -- When bulkstashsave, the stashes array is flat: [data, owner, name, data, owner, name, ...]
        -- and total[4] = 3 * stash_count. Otherwise, stashes is an array of {data, owner, name} tables.
        local stashCount = server.bulkstashsave and (total[4] / 3) or total[4]
        Citizen.CreateThreadNow(function()
            local saved = 0
            if server.bulkstashsave then
                for i = 1, #stashes, 3 do
                    local resp = safeQuery(ChiliadDB.update, {
                        collection = 'ox_stash_inventories',
                        query = { owner = stashes[i + 1], name = tostring(stashes[i + 2]) },
                        update = { owner = stashes[i + 1], name = tostring(stashes[i + 2]), data = stashes[i] },
                        options = { upsert = true },
                    })
                    if resp then saved += 1 end
                end
            else
                for i = 1, #stashes do
                    local entry = stashes[i]
                    local resp = safeQuery(ChiliadDB.update, {
                        collection = 'ox_stash_inventories',
                        query = { owner = entry[2], name = tostring(entry[3]) },
                        update = { owner = entry[2], name = tostring(entry[3]), data = entry[1] },
                        options = { upsert = true },
                    })
                    if resp then saved += 1 end
                end
            end
            pending -= 1
            shared.info(saveStr:format(saved, stashCount, 'stashes', (os.nanotime() - start) / 1e6))
        end)
    end

    repeat Wait(0) until pending == 0
end

return db
