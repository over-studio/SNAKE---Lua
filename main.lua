require("constants")

local timer = 0
local snake = require("Snake")

function love.load()
    snake:Load(0, 0)
end

function love.update(dt)
    timer = timer + dt
    if timer > 0.1 then
        snake.Death()
        snake:Update(dt)
        if snake:Eat() then
            snake:PickLocation()
        end
        timer = 0
    end
end

function love.draw()
    snake:Draw()
end

function love.keypressed(key)
    if key == "right" then snake:dir(1, 0, 2, 2) end
    if key == "left"  then snake:dir(-1, 0, -2, 2) end
    if key == "up"    then snake:dir(0, -1, 3, 2) end
    if key == "down"  then snake:dir(0, 1, -3, 2) end
    -- Debug
    if key == "space" then snake:AddToTail() end
end