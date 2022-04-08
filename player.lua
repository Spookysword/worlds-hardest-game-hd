Player = { x=4*80, y=6*80, w=36.5, h=36.5, moveSpeed = { x=300, y=300 }, color = { 255, 0, 0 }, borderColor = { 0, 0, 0 } }

function HandlePlayerInput(dt)
    local sizeX = 1920 / Level.GridX
    local yOffset = ((Round(Level.GridX*0.5625) - (Level.GridX*0.5625))*sizeX)-(Round(Level.GridX*0.5625))
    if love.keyboard.isDown('w') or love.keyboard.isDown('up') then
        Player.y = Player.y - (Player.moveSpeed.y*dt)
        if PlayerMovement(Level.GridX) == false then
            Player.y = Player.y + (Player.moveSpeed.y*dt)
            -- I know why this needs to be multiplied by 1.5, don't worry about it ;)
            Player.y = (((Round(Player.y/sizeX)) * sizeX) - yOffset) + (Thickness*1.5)
        end
    end
    if love.keyboard.isDown('a') or love.keyboard.isDown('left') then
        Player.x = Player.x - (Player.moveSpeed.x*dt)
        if PlayerMovement(Level.GridX) == false then
            Player.x = Player.x + (Player.moveSpeed.x*dt)
            Player.x = (((Round(Player.x/sizeX)) * sizeX)) + Thickness*2
        end
    end
    if love.keyboard.isDown('s') or love.keyboard.isDown('down') then
        Player.y = Player.y + (Player.moveSpeed.y*dt)
        if PlayerMovement(Level.GridX) == false then
            Player.y = Player.y - (Player.moveSpeed.y*dt)
            Player.y = ((Round(Player.y/sizeX)) * sizeX) + (Thickness/2) - 1
        end
    end
    if love.keyboard.isDown('d') or love.keyboard.isDown('right') then
        Player.x = Player.x + (Player.moveSpeed.x*dt)
        if PlayerMovement(Level.GridX) == false then
            Player.x = Player.x - (Player.moveSpeed.x*dt)
            Player.x = (((Round(Player.x/sizeX)+1) * sizeX)) - Player.w - Thickness*1.5
        end
    end
end

--DrawTest1 = { 0, 0, 0, 0 }
--DrawTest2 = { 0, 0, 0, 0 }

function PlayerMovement(gridX)
    local x, y = 0, 0
    local sizeX = 1920 / gridX
    local yOffset = ((Round(gridX*0.5625) - (gridX*0.5625))*sizeX)-(Round(gridX*0.5625))
    
    for k in pairs(Level.Objects) do
        if Level.Objects[k] == 'w' then
            if AABB((x*sizeX)-(Thickness/2), (y*sizeX)-yOffset-(Thickness/2), sizeX+(Thickness*1.5), sizeX+(Thickness), Player.x-Thickness, Player.y-Thickness, Player.w+(Thickness*2), Player.h+(Thickness*2)) then
                DrawTest1 = { (x*sizeX)-(Thickness/2), (y*sizeX)-yOffset-(Thickness/2), sizeX+(Thickness*1.5), sizeX+(Thickness) }
                DrawTest2 = { Player.x-Thickness, Player.y-Thickness, Player.w+(Thickness*2), Player.h+(Thickness*2) }
                return false
            end
        end
        x = x + 1
        if x % gridX == 0 then
            y = y + 1
            x = 0
        end
    end
    return true
end
