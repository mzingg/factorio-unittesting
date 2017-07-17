UnitTesting.ExperimentsButton = {
    buttonWidget = nil
}

function UnitTesting.ExperimentsButton:new(factorioFlowGui)
    local function init_gui()
        return factorioFlowGui.add({
            type = "button",
            name = "unit-testing-config-button",
            caption = { "unit-testing-open-experiments-caption" },
            style = mod_gui.button_style
        })
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

function UnitTesting.ExperimentsButton:update()
    -- update state of view
end

