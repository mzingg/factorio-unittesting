UnitTesting = {}

function UnitTesting:dump(obj,level)
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