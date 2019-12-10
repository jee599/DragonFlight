require "strict"

require "game"
require "player"
require "enemy"
require "bullet"

function love.load()
    print("Init")
    
    Game:Initialize()
    Player:Initialize()
end

function love.draw()
    Game:Draw()
end

function love.update()

    Game:Update(love.timer.getDelta())
end

