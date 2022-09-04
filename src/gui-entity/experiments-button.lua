UnitTesting.ExperimentsButton = {
    buttonWidget = nil
}

function UnitTesting.ExperimentsButton:new(GUI)
    local function init_gui()
        return GUI.top.add{ type="label", name="greeting", caption="Heya"}
    end

    local newInstance = {
        buttonWidget = init_gui()
    }

    setmetatable(newInstance, self)
    self.__index = self
    return newInstance
end

function UnitTesting.ExperimentsButton:name()
    return self.buttonWidget.name
end

function UnitTesting.ExperimentsButton:update(monitor)
    for _, test in monitor:tests() do
        test:connected()
    end
end

