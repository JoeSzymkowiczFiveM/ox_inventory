if not lib then return end
local ludb = exports['0xludb-fivem']

local db = {}

-- ludb:delete("ox_inventory/bag_644239JBY747789")

function db.loadPlayer(identifier)
    return ludb:retrieve("character_inventory/"..identifier) or {}
end

function db.savePlayer(owner, inventory)
    return ludb:save("character_inventory/"..owner, inventory)
end

function db.saveStash(owner, dbId, inventory)
    local queryString = tostring(owner) ~= '' and "ox_inventory/"..tostring(owner).."/"..dbId or "ox_inventory/"..dbId
    return ludb:save(queryString, inventory)
end

function db.loadStash(owner, name)
    local queryString = tostring(owner) ~= '' and "ox_inventory/"..tostring(owner).."/"..name or "ox_inventory/"..name
    local result = ludb:retrieve(queryString)
    return result and result.data or nil
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
                if trunk[2] then
                    ludb:save("trunk_inventory/"..trunk[2], trunk[1] or {})
                end
            end
            shared.info(('Saved %d/%d trunks (%.4f ms)'):format(#trunks, total[2], (os.nanotime() - start) / 1e6))
        end)
    end

    if total[3] > 0 then
        Citizen.CreateThreadNow(function()
            for i=1, #gloveboxes do
                local glovebox = gloveboxes[i]
                if glovebox[2] then
                    ludb:save("glovebox_inventory/"..glovebox[2], glovebox[1] or {})
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
                    local updateData = { lastupdated = os.time() }
                    if #stashes[i] then updateData.data = stashes[i] end
                    if #stashes[i+1] then updateData.owner = stashes[i+1] end
                    ludb:save("ox_inventory/"..stashes[i+2], updateData )
                end
                shared.info(('Saved %d/%d stashes (%.4f ms)'):format(#stashes / 3, total[4], (os.nanotime() - start) / 1e6))
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
