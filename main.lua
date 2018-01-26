require("constants")

local snake = require("Snake")

function love.load()
    snake:Load(LARGEUR/2, HAUTEUR/2)
end
local timer = 0
function love.update(dt)
    snake.Death()
    snake:Update(dt)
    if snake:Eat() then
        snake:PickLocation()
    end
end

function love.draw()
    snake:Draw()
end

function love.keypressed(key)
    if key == "right" then snake:dir(1, 0) end
    if key == "left" then snake:dir(-1, 0) end
    if key == "up" then snake:dir(0, -1) end
    if key == "down" then snake:dir(0, 1) end
    if key == "space" then snake:AddToTail() end
end