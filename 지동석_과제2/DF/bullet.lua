Bullet = 
{
    image = love.graphics.newImage("assets/bullet.png"),
	
    x = 0,
    y = 0,
    
	speed = 0,
	Index = 0,
	
	List = {},
}

function Bullet:Initialize()
	self.Index = 0
	List = {}
end

function Bullet:Draw()
	for _k, bullet in pairs(self.List) do
		if bullet.isActive == true then
			love.graphics.draw(self.image, bullet.x, bullet.y)
		end
	end
end

function Bullet:Spawn(px, py)
	self.Index = self.Index + 1
	self.List[self.Index] =
    {
		x = px + 50,
        y = py,
        speed = 800,
        isActive = true,
    }
end

function Bullet:Update(deltaTime)
    for _k, bullet in pairs(self.List) do
	    if bullet.isActive == true then
	        bullet.y = bullet.y - bullet.speed * deltaTime
	        if bullet.y < -10 then
	            bullet.isActive = false
	        end
	    end
	end
end