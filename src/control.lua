function dump(obj,level)
  local s,t = '', type(obj)

  level = level or ' '

  if (t=='nil') or (t=='boolean') or (t=='number') or (t=='string') then
    s = tostring(obj)
    if t=='string' then
      s = '"' .. s .. '"'
    end
  elseif t=='function' then s='function'
  elseif t=='userdata' then
    s='userdata'
    local meta = getmetatable(obj) or {}
    for n,v in pairs(meta) do  s = s .. " (" .. n .. "," .. dump(v) .. ")" end
  elseif t=='thread' then s='thread'
  elseif t=='table' then
    s = '{'
    for k,v in pairs(obj) do
      local k_str = tostring(k)
      if type(k)=='string' then
        k_str = '["' .. k_str .. '"]'
      end
      s = s .. k_str .. ' = ' .. dump(v,level .. level) .. ', '
    end
    s = string.sub(s, 1, -3)
    s = s .. '}'
  end
  return s
end

function entityId(entity) 
    return entity.position.x .. "-" .. entity.position.y
end

script.on_init(function()
  global.MockLoaders = {}
end)

script.on_event(defines.events.on_built_entity, function(eventArguments)
    if (eventArguments.created_entity.name == "mock-loader") then
        global.MockLoaders[entityId(eventArguments.created_entity)] = eventArguments.created_entity
    end
end)

script.on_event(defines.events.on_entity_died, function(eventArguments)
    if (eventArguments.entity.name == "mock-loader") then
        global.MockLoaders[entityId(eventArguments.entity)] = nil
    end
end)

script.on_event(defines.events.on_preplayer_mined_item, function(eventArguments)
    if (eventArguments.entity.name == "mock-loader") then
        global.MockLoaders[entityId(eventArguments.entity)] = nil
    end
end)

script.on_event(defines.events.on_tick, function()
    for _,loader in pairs(global.MockLoaders) do
        loader.get_transport_line(1).insert_at_back({name="iron-plate", count=10})
        loader.get_transport_line(2).insert_at_back({name="iron-plate", count=10})
    end
end)