local push = require "push"
require "randomFuncs"
require "drawFuncs"

Thickness = 9

require "player"

local gameWidth, gameHeight = 1920, 1080
local windowWidth, windowHeight = love.window.getDesktopDimensions()
windowWidth, windowHeight = windowWidth*.7, windowHeight*.7

-- General stats
CheckpointColor = { 181, 254, 180 }

Level = { GridX = 24, Objects = { 

  'w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w',
  'w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w',
  'w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w',
  'w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w',
  'w','w','w','s','s','s','w','w','w','w','w','w','w','w','w','w',' ',' ','e','e','e','w','w','w',
  'w','w','w','s','s','s','w',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','w','e','e','e','w','w','w',
  'w','w','w','s','s','s','w',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','w','e','e','e','w','w','w',
  'w','w','w','s','s','s','w',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','w','e','e','e','w','w','w',
  'w','w','w','s','s','s','w',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','w','e','e','e','w','w','w',
  'w','w','w','s','s','s',' ',' ','w','w','w','w','w','w','w','w','w','w','e','e','e','w','w','w',
  'w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w',
  'w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w',
  'w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w',
  'w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w','w'
 }, 
  
  BgColor = { 180, 181, 254 }, GridColor = { 230, 230, 255 }, BallColor = { 0, 0, 255 }, BallBorderColor = { 0, 0, 68 } }

push:setupScreen(gameWidth, gameHeight, windowWidth, windowHeight, {fullscreen = false, resizable = true})

function love.load()
  love.window.setFullscreen(not love.window.getFullscreen())
  push:resize(love.graphics.getWidth(), love.graphics.getHeight())
end

function love.update(dt)
  dt = math.min(dt, 1/30)
  HandlePlayerInput(dt)
end

function love.draw()
  push:start()

  love.graphics.clear(ToDec(Level.BgColor))
  
  DrawGrid(Level.GridX, ToDec(Level.GridColor))
  DrawBG(Level.GridX, ToDec(Level.BgColor), ToDec(CheckpointColor))
  DrawPlayer(Player)

  love.graphics.print("FPS: "..love.timer.getFPS(), 0, 0, 0, 5, 5)
  
  push:finish()
end

function love.resize(w, h)
  push:resize(w, h)
end

function love.keypressed(key)
  if key == 'f11' then
    love.window.setFullscreen(not love.window.getFullscreen())
    push:resize(love.graphics.getWidth(), love.graphics.getHeight())
  end
end
