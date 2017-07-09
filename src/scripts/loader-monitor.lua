UnitTesting.LoaderMonitor = {
    loaderMap = {}
}

function UnitTesting.LoaderMonitor:registerLoader(factorioEntity)
    if (self:isUnitTestingLoaderEntity(factorioEntity)) then
        self.loaderMap[self:createEntityId(factorioEntity)] = factorioEntity
    end
end

function UnitTesting.LoaderMonitor:unregisterLoader(factorioEntity)
    if (self:isUnitTestingLoaderEntity(factorioEntity)) then
        factorioEntity.get_transport_line(1).clear()
        factorioEntity.get_transport_line(2).clear()

        self.loaderMap[self:createEntityId(factorioEntity)] = nil
    end
end

function UnitTesting.LoaderMonitor:updateLoaderStates(gameTicks)
    local fullyCompressedItemCount = 4
    for _, loader in pairs(self.loaderMap) do
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
                for i = 0, fullyCompressedItemCount - 1 do
                    leftLane.insert_at((0.1 + i) / fullyCompressedItemCount, { name = leftItem, count = 1 })
                end
            end
            if (rightItem ~= nil) then
                for i = 0, fullyCompressedItemCount - 1 do
                    rightLane.insert_at((0.1 + i) / fullyCompressedItemCount, { name = rightItem, count = 1 })
                end
            end
        else
            leftLane.clear()
            rightLane.clear()
        end
    end
end

function UnitTesting.LoaderMonitor:isUnitTestingLoaderEntity(factorioEntity)
    return factorioEntity.name == "mock-loader"
end

function UnitTesting.LoaderMonitor:createEntityId(factorioEntity)
    return factorioEntity.position.x .. "-" .. factorioEntity.position.y
end