local push = require "push"
require "randomFuncs"
require "drawFuncs"

local gameWidth, gameHeight = 1280, 720 --fixed game resolution
local windowWidth, windowHeight = love.window.getDesktopDimensions()
windowWidth, windowHeight = windowWidth*.7, windowHeight*.7 --make the window a bit smaller than the screen itself

Level = { GridX = 20, BgColor = { 170, 165, 255 }, GridColor = { 224, 218, 254 }, BallColor = { 0, 0, 255 }, BallBorderColor = { 0, 0, 68 } }

push:setupScreen(gameWidth, gameHeight, windowWidth, windowHeight, {fullscreen = false, resizable = true})

function love.draw()
  push:start()

  love.graphics.clear(ToDec(Level.BgColor))
  
  DrawGrid(Level.GridX, ToDec(Level.GridColor))
  
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
  if key == 'up' then
    Level.GridX = Level.GridX + 1
    print(Level.GridX)
  end
  if key == 'down' then
    Level.GridX = Level.GridX - 1
    print(Level.GridX)
  end
end