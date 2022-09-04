UnitTesting.Asserter = {
    entity = nil
}

function UnitTesting.Asserter.registerAll(monitor)
    local allAsserters = game.surfaces[1].find_entities_filtered { name = "tdf-assert-that" }
    for i, foundAsserter in ipairs(allAsserters) do
        monitor:register(foundAsserter)
    end
end

function UnitTesting.Asserter:new(factorioEntity)
    local newInstance = {
        entity = factorioEntity
    }

    setmetatable(newInstance, self)
    self.__index = self
    return newInstance
end

function UnitTesting.Asserter:cleanup()
    if (self.entity == nil) then
        return
    end
end

function UnitTesting.Asserter:update(gameTick)
    if (self.entity == nil) then
        return
    end
end

function UnitTesting.Asserter:connected()
    if (self.entity == nil) then
        return
    end

    for _, connectedEntities in pairs(self.entity.circuit_connected_entities) do
        for _, entity in pairs(connectedEntities) do
            game.print(entity.name)
            game.print(entity.unit_number)
        end
    end
end

