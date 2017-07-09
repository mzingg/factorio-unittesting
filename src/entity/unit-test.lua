UnitTesting.UnitTest = {
    entity = nil,
}

function UnitTesting.UnitTest:new(factorioEntity)
    local newInstance = {
        entity = factorioEntity
    }

    setmetatable(newInstance, self)
    self.__index = self
    return newInstance
end

function UnitTesting.UnitTest:cleanup()
    if (self.entity == nil) then return end
end

function UnitTesting.UnitTest:update(gameTick)
    if (self.entity == nil) then return end
end