Enemy = 
{
    image = love.graphics.newImage("assets/enemy.png"),
    x = 0,
    y = 0,
    speed = 0,
	Index = 0,
	List = {},
	Time = 0,
	spawnTime = 0,
}

function Enemy:Initialize()
	self.Index = 0
	self.spawnTime = -1
	for i = 0, 4 do
		self.List[i + self.Index*5] = {
			x = love.graphics.getWidth() / 5 * i,
			y = 0,
			Speed = self.Index / 2,
			Time = 0,
			Life = 1,
			isActive = true;
		}
	end
end

function Enemy:Draw()
	for _k, enemy in pairs(self.List) do
		if enemy.isActive == true then
			love.graphics.draw(self.image, enemy.x, enemy.y)
		end
	end
end

function Enemy:Spawn()
	self.Index = self.Index + 1
	for i = 0,4 do
		self.List[i + self.Index * 5] = {
			x = love.graphics.getWidth() / 5 * i,
			y = 0,
			Speed = self.Index / 2,
			Time = 0,
			Life = 1,
			isActive = true;
		}
	end
end

function Enemy:Update(deltaTime)

	self.Time = self.Time + deltaTime
	if self.spawnTime ~= math.floor(self.Time) then
		self:Spawn()
		self.spawnTime = math.floor(self.Time)
	end
	for _k, enemy in pairs(self.List) do
		if enemy.isActive == true then
			if enemy.Life <= 0 then
				enemy.isActive = false
			end
			enemy.Time = enemy.Time + deltaTime
			if enemy.Speed > 10 then
				enemy.Speed = 10
			end
			local speed = math.ceil(enemy.Time)
			if speed > 5 then
				speed = 5
			end
			enemy.y = enemy.y + enemy.Speed + speed
		end
	end
end