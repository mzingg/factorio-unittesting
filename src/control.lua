require("scripts.base")
require("scripts.mock-loader")
require("scripts.loader-monitor")

script.on_event(defines.events.on_built_entity, function(eventArguments)
    UnitTesting.LoaderMonitor:registerLoader(eventArguments.created_entity)
end)

script.on_event(defines.events.on_entity_died, function(eventArguments)
    UnitTesting.LoaderMonitor:unregisterLoader(eventArguments.entity)
end)

script.on_event(defines.events.on_preplayer_mined_item, function(eventArguments)
    UnitTesting.LoaderMonitor:unregisterLoader(eventArguments.entity)
end)

script.on_event(defines.events.on_tick, function()
    UnitTesting.LoaderMonitor:updateLoaderStates(game.tick);
end)