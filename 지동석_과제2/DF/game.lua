Game =
{
    Score = 0,
	Time = 0,
}

function Game:Initialize()
    self.Score = 0
	self.Time = 0
end

function Game:Draw()
	Game:DrawUI()
	Player:Draw()
	Enemy:Draw()
	Bullet:Draw()
end

function Game:DrawUI()
    love.graphics.print("Score : "..Game.Score, 0, 0)
	love.graphics.print("Time : "..math.floor(self.Time),480,0)
end

function Game:Collision()
	for _k, enemy in pairs(Enemy.List) do
		if enemy.isActive == true then
			local enemySize = Enemy.image:getWidth() / 2
			local playerSize = Player.image:getWidth() / 2
			
			-- collision player to enemy
			if math.sqrt(math.pow((enemy.x + enemySize) - (Player.x + playerSize), 2) + math.pow((enemy.y + enemySize) - (Player.y + playerSize),2))
			< (Enemy.image:getWidth() / 3 + Player.image:getWidth() / 3) then
				love.event.push('quit')
			end
			for _k, bullet in pairs(Bullet.List) do
				local bulletSize = Bullet.image:getWidth() / 2
				if (bullet.isActive == true) and 
				-- collision bullet to enemy
				(math.sqrt(math.pow((bullet.x + bulletSize) - (enemy.x + enemySize),2) + math.pow((bullet.y + bulletSize) - (enemy.y + enemySize),2)) 
				< (Enemy.image:getWidth() / 3 + bulletSize)) then
					enemy.Life = enemy.Life - 1
					self.Score = self.Score + 10
					bullet.isActive = false
				end 
			end
		end
	end
end

function Game:Update(deltaTime)

	self.Time = self.Time + deltaTime	-- record time
	Player:Update(deltaTime)
	Enemy:Update(deltaTime)
	Bullet:Update(deltaTime)
	
	Game:Collision()
	
end