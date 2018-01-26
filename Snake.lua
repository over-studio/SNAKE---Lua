Snake = {}

local food = {}
local scl = 20

function Snake:Load(x, y)
    Snake.x = x
    Snake.y = y
    Snake.xspeed = 1
    Snake.yspeed = 0
    Snake.head = nil
    Snake.tail = {}
    Snake.counter = 0

    Snake:PickLocation()
end

function Snake:dir(x, y)
    Snake.xspeed = x
    Snake.yspeed = y
end

function Snake:Update(dt)
    if Snake.counter == #Snake.tail then
        for i=1, #Snake.tail-1 do
            Snake.tail[i] = Snake.tail[i+1]
        end
    end
    Snake.tail[Snake.counter] = {x=Snake.x, y=Snake.y}

    Snake.x = Snake.x + Snake.xspeed * scl
    Snake.y = Snake.y + Snake.yspeed * scl

    if Snake.x > LARGEUR then Snake.x = 0 end
    if Snake.y > HAUTEUR then Snake.y = 0 end
    if Snake.x < 0 then Snake.x = LARGEUR end
    if Snake.y < 0 then Snake.y = HAUTEUR end
end

function Snake:Draw()
    love.graphics.setColor(255, 255, 255)
    for i=2, #Snake.tail do
        love.graphics.rectangle("fill", Snake.tail[i].x, Snake.tail[i].y, scl-1, scl-1)
    end
    if #Snake.tail > 0 then
        love.graphics.setColor(0, 255, 0)
        love.graphics.rectangle("fill", Snake.tail[1].x, Snake.tail[1].y, scl-1, scl-1)
    end

    love.graphics.setColor(255, 0, 0)
    love.graphics.rectangle("fill", Snake.x, Snake.y, scl-1, scl-1)

    love.graphics.setColor(255, 0, 255)
    love.graphics.rectangle("fill", food.x, food.y, scl-1, scl-1)
end

function Snake:Eat()
    if math.abs(Snake.x - food.x) < scl and math.abs(Snake.y - food.y) < scl then
        Snake.counter = Snake.counter + 1
        print("eat")
        return true
    else
        return false
    end
end

function Snake:Death()
    for i=1, #Snake.tail do
        local pos = Snake.tail[i]
        if pos ~= nil and math.abs(Snake.x - pos.x) < scl and math.abs(Snake.y - pos.y) < scl then 
            Snake.counter = 0
            Snake.tail = {}
        end
    end
end

function Snake:AddToTail()
    Snake.counter = Snake.counter + 1
end

function Snake:PickLocation()
    local cols = math.floor(LARGEUR / scl)
    local rows = math.floor(HAUTEUR / scl)
    
    food = {x=math.random(1, cols-1) * scl, y=math.random(1, rows-1) * scl}
end

return Snake