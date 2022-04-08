function DrawGrid(gridX, gridColor)
    local x, y = 0, 0
    local gridYReal = gridX*0.5625
    local sizeX = 1920 / gridX
    -- This formuala is pretty much the result of me banging my head against a wall until it worked.
    -- Could be very optimized and still doesn't even fully work, it's like 4 pixels off.
    local yOffset = ((Round(gridX*0.5625) - (gridX*0.5625))*sizeX)-(Round(gridX*0.5625))
    while x < gridX+1 do
        y = 0
        local t = true
        while y < gridYReal do
            t = not t
            local add = 0
            if t then
                add = 1
            end
            if x % 2 == 0 then
                love.graphics.setColor(gridColor[1], gridColor[2], gridColor[3], 1)
            else
                love.graphics.setColor(1, 1, 1, 1)
            end
            love.graphics.rectangle('fill', sizeX*(x-add), (sizeX*y)-yOffset, sizeX, sizeX)
            y = y + 1
        end
        x = x + 1
    end
end

function DrawBG(gridX, wallColor, checkpointColor)
    local sizeX = 1920 / gridX
    local x, y = 0, 0
    -- This formuala is pretty much the result of me banging my head against a wall until it worked.
    -- Could be very optimized and still doesn't even fully work, it's like 4 pixels off.
    local yOffset = ((Round(gridX*0.5625) - (gridX*0.5625))*sizeX)-(Round(gridX*0.5625))
    local toDrawLines = {}
    for k in pairs(Level.Objects) do
        if Level.Objects[k] ~= ' ' then
            local wall = false
            if Level.Objects[k] == 'w' then
                wall = true
                love.graphics.setColor(wallColor[1], wallColor[2], wallColor[3], 1)
            elseif Level.Objects[k] == 's' or Level.Objects[k] == 'c' or Level.Objects[k] == 'e' then
                love.graphics.setColor(checkpointColor[1], checkpointColor[2], checkpointColor[3], 1)
            end
            love.graphics.rectangle('fill', sizeX*x, (sizeX*y)-yOffset, sizeX, sizeX)
            if wall then
                if Level.Objects[k+gridX] ~= 'w' and Level.Objects[k+gridX] ~= nil then
                    table.insert(toDrawLines, { (sizeX*x), ((sizeX*y)+sizeX-(Thickness/2))-yOffset, sizeX+(Thickness/2), Thickness, 0, 0 })
                end
                if Level.Objects[k-gridX] ~= 'w' and Level.Objects[k-gridX] ~= nil then
                    table.insert(toDrawLines, { (sizeX*x), ((sizeX*y)-(Thickness/2))-yOffset, sizeX+(Thickness/2), Thickness, 0, 0 })
                end
                if Level.Objects[k-1] ~= 'w' and Level.Objects[k-1] ~= nil then
                    table.insert(toDrawLines, { (sizeX*x)-(Thickness/2), ((sizeX*y)-(Thickness/2))-yOffset, Thickness, sizeX+Thickness, 0, 0 })
                end
                if Level.Objects[k+1] ~= 'w' and Level.Objects[k+1] ~= nil then
                    table.insert(toDrawLines, { (sizeX*x)+sizeX, ((sizeX*y)-(Thickness/2))-yOffset, Thickness, sizeX+Thickness, 0, 0 })
                end
            end
        end
        x = x + 1
        if x % gridX == 0 then
            y = y + 1
            x = 0
        end
    end
    for k in pairs(toDrawLines) do
        love.graphics.setColor(0, 0, 0, 1)
        love.graphics.rectangle('fill', toDrawLines[k][1], toDrawLines[k][2], toDrawLines[k][3], toDrawLines[k][4], toDrawLines[k][5], toDrawLines[k][6])
    end
end

function DrawPlayer(player)
    love.graphics.setColor(ToDec(player.borderColor)[1], ToDec(player.borderColor)[2], ToDec(player.borderColor)[3], 1)
    love.graphics.rectangle('fill', player.x-Thickness, player.y-Thickness, player.w+Thickness*2, player.h+Thickness*2)
    love.graphics.setColor(ToDec(player.color)[1], ToDec(player.color)[2], ToDec(player.color)[3], 1)
    love.graphics.rectangle('fill', player.x, player.y, player.w, player.h)
end
