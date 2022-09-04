UnitTesting.Monitor = {
    initialized = false,
    initRunning = false,
    loaderMap = {},
    asserterMap = {},
    guiMap = {}
}

function UnitTesting.Monitor:register(factorioEntity)
    if (self:isMockLoader(factorioEntity)) then
        self.loaderMap[factorioEntity.unit_number] = UnitTesting.MockLoader:new(factorioEntity)
        game.print("Mock Registered", { 1.0, 1.0, 1.0, 1.0 })
        game.print(factorioEntity.unit_number, { 1.0, 1.0, 1.0, 1.0 })
    end
    if (self:isAsserter(factorioEntity)) then
        self.asserterMap[factorioEntity.unit_number] = UnitTesting.Asserter:new(factorioEntity)
        game.print("Asserter Registered", { 1.0, 1.0, 1.0, 1.0 })
        game.print(factorioEntity.unit_number, { 1.0, 1.0, 1.0, 1.0 })
    end
end

function UnitTesting.Monitor:unregister(factorioEntity)
    if (self:isRegistered(factorioEntity) and self:isMockLoader(factorioEntity)) then
        self.loaderMap[factorioEntity.unit_number]:cleanup()
        self.loaderMap[factorioEntity.unit_number] = nil
    end
    if (self:isRegistered(factorioEntity) and self:isAsserter(factorioEntity)) then
        self.asserterMap[factorioEntity.unit_number]:cleanup()
        self.asserterMap[factorioEntity.unit_number] = nil
    end
end

function UnitTesting.Monitor:update(gameTick)
    if (self.initialized) then
        for _, loader in pairs(self.loaderMap) do
            loader:update(gameTick);
        end
        for _, asserter in pairs(self.asserterMap) do
            asserter:update(gameTick);
        end
    else
        if (not self.initRunning) then
            self.initRunning = true
            UnitTesting.MockLoader.registerAll(self)
            UnitTesting.Asserter.registerAll(self)
            self.initialized = true
            self.initRunning = false
        end
    end
end

function UnitTesting.Monitor:tests()
    return pairs(self.asserterMap)
end

function UnitTesting.Monitor:registerGui(playerIndex, factorioPlayer)
    if (not self.guiMap[playerIndex]) then
        self.guiMap[playerIndex] = {}
    end
    local experimentsButton = UnitTesting.ExperimentsButton:new(factorioPlayer.gui)
    self.guiMap[playerIndex][experimentsButton:name()] = experimentsButton
end

function UnitTesting.Monitor:updateGui(playerIndex, guiElement)
    if (self.guiMap[playerIndex]) then
        for _, registeredGuiElement in pairs(self.guiMap[playerIndex]) do
            if (guiElement.name == registeredGuiElement:name()) then
                registeredGuiElement:update(self);
            end
        end
    end
end

function UnitTesting.Monitor:isAsserter(factorioEntity)
    return factorioEntity.valid and factorioEntity.unit_number and factorioEntity.name == "tdf-assert-that"
end

function UnitTesting.Monitor:isMockLoader(factorioEntity)
    return factorioEntity.valid and factorioEntity.unit_number and factorioEntity.name == "tdf-mock-loader"
end

function UnitTesting.Monitor:isRegistered(factorioEntity)
    return self.asserterMap[factorioEntity.unit_number] ~= nil or self.loaderMap[factorioEntity.unit_number] ~= nil
end