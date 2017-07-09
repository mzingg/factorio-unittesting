UnitTesting.Monitor = {
    loaderMap = {},
    testMap = {}
}

function UnitTesting.Monitor:register(factorioEntity)
    if (self:isMockLoader(factorioEntity)) then
        self.loaderMap[factorioEntity.unit_number] = UnitTesting.MockLoader:new(factorioEntity)
    end
    if (self:isUnitTest(factorioEntity)) then
        self.testMap[factorioEntity.unit_number] = UnitTesting.UnitTest:new(factorioEntity)
    end
end

function UnitTesting.Monitor:unregister(factorioEntity)
    if (self:isMockLoader(factorioEntity)) then
        self.loaderMap[factorioEntity.unit_number]:cleanup()
        self.loaderMap[factorioEntity.unit_number] = nil
    end
    if (self:isUnitTest(factorioEntity)) then
        self.testMap[factorioEntity.unit_number]:cleanup()
        self.testMap[factorioEntity.unit_number] = nil
    end
end

function UnitTesting.Monitor:update(gameTick)
    for _, loader in pairs(self.loaderMap) do
        loader:update(gameTick);
    end
    for _, test in pairs(self.testMap) do
        test:update(gameTick);
    end
end

function UnitTesting.Monitor:isUnitTest(factorioEntity)
    return factorioEntity.valid and factorioEntity.unit_number and factorioEntity.name == "unit-test"
end

function UnitTesting.Monitor:isMockLoader(factorioEntity)
    return factorioEntity.valid and factorioEntity.unit_number and factorioEntity.name == "mock-loader"
end