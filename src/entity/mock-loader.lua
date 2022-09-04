UnitTesting.MockLoader = {
    entity = nil,
    desiredItemCount = 4
}

function UnitTesting.MockLoader.registerAll(monitor)
    local allLoaders = game.surfaces[1].find_entities_filtered { name = "tdf-mock-loader" }
    for i, foundLoader in ipairs(allLoaders) do
        monitor:register(foundLoader)
    end
end

function UnitTesting.MockLoader:new(factorioEntity)
    local newInstance = {
        entity = factorioEntity
    }

    setmetatable(newInstance, self)
    self.__index = self
    return newInstance
end

function UnitTesting.MockLoader:cleanup()
    if (self.entity == nil) then
        return
    end

    self.entity.get_transport_line(1).clear()
    self.entity.get_transport_line(2).clear()
end

function UnitTesting.MockLoader:update(gameTick)
    if (self.entity == nil) then
        return
    end

    local loader = self.entity
    local leftLane = loader.get_transport_line(1)
    local rightLane = loader.get_transport_line(2)
    if (loader.loader_type == "output") then
        local leftItem = loader.get_filter(1)
        local rightItem = loader.get_filter(2)
        if (loader.direction == defines.direction.south) then
            leftItem = loader.get_filter(2)
            rightItem = loader.get_filter(1)
        end

        if (leftItem ~= nil) then
            for i = 0, self.desiredItemCount - 1 do
                leftLane.insert_at((0.1 + i) / self.desiredItemCount, { name = leftItem, count = 1 })
            end
        end
        if (rightItem ~= nil) then
            for i = 0, self.desiredItemCount - 1 do
                rightLane.insert_at((0.1 + i) / self.desiredItemCount, { name = rightItem, count = 1 })
            end
        end
    else
        leftLane.clear()
        rightLane.clear()
    end
end