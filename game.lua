game = {}
game.snake = require("Snake")

game.Load = function()
    game.snake = require("Snake")
    -- créer le Snake
    game.snake:new(LARGEUR/2, HAUTEUR/2)
end

game.Update = function(dt)
    for i=#game.cases, 2 do
        game.cases[i].x = game.cases[i-1].x
        game.cases[i].y = game.cases[i-1].y

        print(game.cases[i].x)

        --game.cases[i].nx = game.cases[i-1].x
        --game.cases[i].ny = game.cases[i-1].y

        --game.cases[i].x = game.cases[i-1].x + math.abs(game.cases[i].nx - game.cases[i].x) * dt
        --game.cases[i].y = game.cases[i-1].y + math.abs(game.cases[i].ny - game.cases[i].y) * dt
        
        --print(game.cases[i].x)
        --game.cases[i].x = game.cases[game.cases[i].dep].x
        --game.cases[i].y = game.cases[game.cases[i].dep].y
    end

    print("--------")

    if game.cases[1].x > LARGEUR then game.cases[1].x = 0 end
    if game.cases[1].y > HAUTEUR then game.cases[1].y = 0 end
    if game.cases[1].x < 0 then game.cases[1].x = LARGEUR end
    if game.cases[1].y < 0 then game.cases[1].y = HAUTEUR end
end

game.Draw = function()
    for i=1, #game.cases do
        game.cases[i].render()
    end
    
    love.graphics.print("x = ", 10, 10)
    love.graphics.print("y = ", 10, 30)
    love.graphics.print("nx = ", 10, 50)
    love.graphics.print("ny = ", 10, 70)
    
    for i=1, #game.cases do
        love.graphics.print(math.floor(game.cases[i].x), 80*(i-1)+50, 10)
        love.graphics.print(math.floor(game.cases[i].y), 80*(i-1)+50, 30)
    end
end

game.KeyPressed = function(key)
    if key == "right" then game.snake:dir(1, 0) end
    if key == "left" then game.snake:dir(-1, 0) end
    if key == "up" then game.snake:dir(0, -1) end
    if key == "down" then game.snake:dir(0, 1) end
end

return game