Player = { x=4*80, y=6*80, w=36.5, h=36.5, moveSpeed = { x=300, y=300 }, color = { 255, 0, 0 }, borderColor = { 0, 0, 0 } }

function HandlePlayerInput(dt)
    if love.keyboard.isDown('w') or love.keyboard.isDown('up') then
        Player.y = Player.y - (Player.moveSpeed.y*dt)
    end
    if love.keyboard.isDown('a') or love.keyboard.isDown('left') then
        Player.x = Player.x - (Player.moveSpeed.x*dt)
    end
    if love.keyboard.isDown('s') or love.keyboard.isDown('down') then
        Player.y = Player.y + (Player.moveSpeed.y*dt)
    end
    if love.keyboard.isDown('d') or love.keyboard.isDown('right') then
        Player.x = Player.x + (Player.moveSpeed.x*dt)
    end
end
