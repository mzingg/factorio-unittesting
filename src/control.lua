UnitTesting = {}

require("mod-gui")
require("entity.all")
require("gui-entity.all")
require("scripts.monitor")

script.on_event(defines.events.on_built_entity, function(eventArguments)
    UnitTesting.Monitor:register(eventArguments.created_entity)
end)

script.on_event(defines.events.on_robot_built_entity, function(eventArguments)
    UnitTesting.Monitor:register(eventArguments.created_entity)
end)

script.on_event(defines.events.on_entity_died, function(eventArguments)
    UnitTesting.Monitor:unregister(eventArguments.entity)
end)

script.on_event(defines.events.on_preplayer_mined_item, function(eventArguments)
    UnitTesting.Monitor:unregister(eventArguments.entity)
end)

script.on_event(defines.events.on_robot_mined_entity, function(eventArguments)
    UnitTesting.Monitor:unregister(eventArguments.entity)
end)

script.on_event(defines.events.on_tick, function()
    UnitTesting.Monitor:update(game.tick)
end)

script.on_event(defines.events.on_player_joined_game, function(event)
    UnitTesting.Monitor:registerGui(event.player_index, game.players[event.player_index])
end)

script.on_event(defines.events.on_gui_click, function(event)
    UnitTesting.Monitor:updateGui(event.player_index, event.element)
end)