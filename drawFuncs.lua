function DrawGrid(gridX, gridColor)
    local x, y = 0, 0
    local gridYReal = gridX*0.5625
    local sizeX = 1280 / gridX
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
                love.graphics.setColor(1, 1, 1, 1)
            else
                love.graphics.setColor(gridColor[1], gridColor[2], gridColor[3], 1)
            end
            love.graphics.rectangle('fill', sizeX*(x-add), sizeX*y, sizeX, sizeX, 1, 1, 1)
            y = y + 1
        end
        x = x + 1
    end
end