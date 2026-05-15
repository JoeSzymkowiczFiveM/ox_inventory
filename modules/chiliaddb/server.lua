if not lib then return end

local Query = {
    SELECT_STASH = 'SELECT data FROM ox_inventory WHERE owner = ? AND name = ?',
    UPDATE_STASH = 'UPDATE ox_inventory SET data = ? WHERE owner = ? AND name = ?',
    UPSERT_STASH =
    'INSERT INTO ox_inventory (data, owner, name) VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE data = VALUES(data)',
    INSERT_STASH = 'INSERT INTO ox_inventory (owner, name) VALUES (?, ?)',
    SELECT_GLOVEBOX = 'SELECT plate, glovebox FROM `{vehicle_table}` WHERE `{vehicle_column}` = ?',
    SELECT_TRUNK = 'SELECT plate, trunk FROM `{vehicle_table}` WHERE `{vehicle_column}` = ?',
    SELECT_PLAYER = 'SELECT inventory FROM `{user_table}` WHERE `{user_column}` = ?',
    UPDATE_TRUNK = 'UPDATE `{vehicle_table}` SET trunk = ? WHERE `{vehicle_column}` = ?',
    UPDATE_GLOVEBOX = 'UPDATE `{vehicle_table}` SET glovebox = ? WHERE `{vehicle_column}` = ?',
    UPDATE_PLAYER = 'UPDATE `{user_table}` SET inventory = ? WHERE `{user_column}` = ?',
}
-- user_table = 'character_inventory'
-- user_column = 'charid'
-- vehicle_table = 'vehicles'
-- vehicle_column = 'id'

ChiliadDB.ready(function()
    local clearStashes = GetConvar('inventory:clearstashes', '6 MONTH')
    if clearStashes ~= '' then
        local sixMonthsAgo = os.time() - 15778476000
        pcall(ChiliadDB.delete({collection = 'ox_inventory', query = {lastUpdated = { ['$lt'] = sixMonthsAgo}}}))
    end
end)

db = {}

function db.loadPlayer(identifier)
    -- local inventory = MySQL.prepare.await(Query.SELECT_PLAYER, { identifier }) --[[@as string?]]
    local result = ChiliadDB.findOne({collection = 'ox_inventory', query = {charid = identifier}, options = {includeFields = {inventory = 1}}})
    return result and result.inventory
end

function db.savePlayer(owner, inventory)
    -- return MySQL.prepare(Query.UPDATE_PLAYER, { inventory, owner })
    return ChiliadDB.update({collection = 'ox_inventory', query = {charid = owner}, update = {inventory = inventory}})
end

function db.saveStash(owner, dbId, inventory)
    -- return MySQL.prepare(Query.UPSERT_STASH, { inventory, owner and tostring(owner) or '', dbId })
    local owner = owner and tostring(owner) or ''
    return ChiliadDB.update({collection = 'ox_inventory', query = {owner = owner, name = dbId}, update = {data = inventory}, options = {upsert = true}})
end

function db.loadStash(owner, name)
    -- return MySQL.prepare.await(Query.SELECT_STASH, { owner and tostring(owner) or '', name })
    local owner = owner and tostring(owner) or ''
    local stash = ChiliadDB.findOne({collection = 'ox_inventory', query = {owner = owner, name = name}})
    return stash
end

function db.saveGlovebox(id, inventory)
    -- return MySQL.prepare(Query.UPDATE_GLOVEBOX, { inventory, id })
    return ChiliadDB.update({collection = 'vehicles', query = {id = id}, update = {glovebox = inventory}})
end

function db.loadGlovebox(id)
    -- return MySQL.prepare.await(Query.SELECT_GLOVEBOX, { id })
    local glovebox = ChiliadDB.findOne({collection = 'vehicles', query = {id = id}, options = {includeFields = {['glovebox'] = true, ['plate'] = true}} })
    return glovebox
end

function db.saveTrunk(id, inventory)
    -- return MySQL.prepare(Query.UPDATE_TRUNK, { inventory, id })
    return ChiliadDB.update({collection = 'vehicles', query = {id = id}, update = {trunk = inventory}})
end

function db.loadTrunk(id)
    -- return MySQL.prepare.await(Query.SELECT_TRUNK, { id })
    local trunk = ChiliadDB.findOne({collection = 'vehicles', query = {id = id}})
    return trunk
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
        Citizen.CreateThreadNow(function()
            local count = 0
            for i=1, #players do
                local player = players[i]
                ChiliadDB.update({collection = 'ox_inventory', query = {charid = player[2]}, update = {inventory = player[1] or {}}, options = {upsert = true}})
                count += 1
            end
            shared.info(('Saved %d/%d players (%.4f ms)'):format(count, total[1], (os.nanotime() - start) / 1e6))
        end)
    end

    if total[2] > 0 then
        Citizen.CreateThreadNow(function()
            local count = 0
            for i=1, #trunks do
                local trunk = trunks[i]
                ChiliadDB.update({collection = 'vehicles', query = {id = trunk[2]}, update = {trunk = trunk[1] or {}}})
                count += 1
            end
            shared.info(('Saved %d/%d trunks (%.4f ms)'):format(count, total[1], (os.nanotime() - start) / 1e6))
        end)
    end

    if total[3] > 0 then
        Citizen.CreateThreadNow(function()
            local count = 0
            for i=1, #gloveboxes do
                local glovebox = gloveboxes[i]
                ChiliadDB.update({collection = 'vehicles', query = {id = glovebox[2]}, update = {glovebox = glovebox[1] or {}}})
                count += 1
            end
            shared.info(('Saved %d/%d gloveboxes (%.4f ms)'):format(count, total[1], (os.nanotime() - start) / 1e6))
        end)
    end

    if total[4] > 0 then
        pending += 1

        if server.bulkstashsave then
            total[4] /= 3

            -- Citizen.CreateThreadNow(function()
            --     local query = Query.UPSERT_STASH:gsub('%(%?, %?, %?%)', string.rep('(?, ?, ?)', total[4], ', '))
            --     local resp = safeQuery(MySQL.query.await, query, stashes)
            --     pending -= 1

            --     if resp then
            --         local affectedRows = resp.affectedRows

            --         if total[4] == 1 then
            --             if affectedRows == 2 then affectedRows = 1 end
            --         else
            --             affectedRows -= tonumber(resp.info:match('Duplicates: (%d+)'), 10) or 0
            --         end

            --         shared.info(saveStr:format(affectedRows, total[4], 'stashes', (os.nanotime() - start) / 1e6))
            --     end
            -- end)
        else
            -- Citizen.CreateThreadNow(function()
            --     local resp = safeQuery(MySQL.rawExecute.await, Query.UPSERT_STASH, stashes)
            --     pending -= 1

            --     if resp then
            --         local affectedRows = 0

            --         if table.type(resp) == 'hash' then
            --             if resp.affectedRows > 0 then affectedRows = 1 end
            --         else
            --             for i = 1, #resp do
            --                 if resp[i].affectedRows > 0 then affectedRows += 1 end
            --             end
            --         end

            --         shared.info(saveStr:format(affectedRows, total[4], 'stashes', (os.nanotime() - start) / 1e6))
            --     end
            -- end)
        end
    end

    -- repeat Wait(0) until pending == 0
end

return db
